:- include(artikels_hln3).

%:- lib(xml).

:- lib(branch_and_bound).

% Structures preamble
:- local 
		struct(page(id, width, height, anchors, ads, articles)),
		struct(ad(id, x, y, width, height)),
		struct(article(id, type, plaatsing, layouts)),
		struct(layout(id, width, height)),
		struct(allocation(pageid, artid, layoutid, sx, sy, ex, ey, score)),
		struct(anchor(x, y)).

try(Pages, Matlab) :-
	[NumberOfColumns, RowHeight] = [6, 100],
		% Load Pages
	loadPages(RawPages),
	convertPages([NumberOfColumns, RowHeight], RawPages, ConvertedPages),
	%print_list(ConvertedPages),
		% Load Articles
	loadArticles(RawArticles),
	convertArticles(RawArticles, ConvertedArticles),
	%print_list(ConvertedArticles),
		% Do Layout
	ConvertedPages = [FirstPage | _],
	ConvertedArticles = [FirstArticle | _],
	doArticles(ConvertedArticles, [FirstPage], Pages),
	exportToMatlab(Pages, Matlab).

% doArticles
doArticles([ThisArticle | OtherArticles], EmptyPages, FilledPages) :-
	(
			% Try to place ThisArticle on a page
		write('Trying Article: '), writeln(ThisArticle),
			% Find all possible allocations
		findall(
			[Anchor, AllocationOnAnchor],
			doArticleOnPage(ThisArticle, EmptyPages,   Anchor, AllocationOnAnchor),
			AllPossibleAllocations),
		%writeln(AllPossibleAllocations),
			% Find best allocation
		findBestAllocation(EmptyPages, AllPossibleAllocations, BestAllocation),
		%print_list(BestAllocation),
		doAllocation(BestAllocation, EmptyPages, PagesWithThisArticle),
		write('Placed:         '), writeln(PagesWithThisArticle)
	; 
		writeln('Failed to place article'),
		PagesWithThisArticle = EmptyPages
	),
		% Place next article
	doArticles(OtherArticles, PagesWithThisArticle, FilledPages).
doArticles([], X, X).

%A = , sort(1, =<, A, B), B = [C | _], C = [D, _], findall(X, (member(X, B), X = [D, _]), L).try(P,M).

% findBestAllocation !!! HEURISTIC IMPLEMENTATION TODO
%findBestAllocation(_, [First | _], First).	% TODO
findBestAllocation(_, A, B) :- member(B, A).

%findBestAllocation(_, All, Best) :-
%	A = All, 
%	sort(1, =<, A, B), 
%	B = [C | _], 
%	C = [D, _], 
%	findall(X, (member(X, B), X = [D, _]), L),
%	%print_list(L),
%	L = [Best | _].

%	writeln(All).
%	sort(2, =<, All, Best0),
%	Best0 = [anchor{
%	
%	findall(X, member(X, Best0

doAllocation([Anchor, Allocation], [ThisPage | NextPages], PagesOut) :-
	(
			% Find right Page
		Allocation = allocation{pageid:Id},
		ThisPage = page{id:Id}, !,
			% Remove anchor where the article was added
		ThisPage = page{anchors:OldAnchors, articles:OldAllocations},
		Allocation = allocation{sx:SX, sy:SY, ex:EX, ey:EY},
		delete(Anchor, OldAnchors, RemainingOldAnchors),
			% This article anchors
		ExtraAnchors = [anchor{x:SX, y:SY}, anchor{x:SX, y:EY}, anchor{x:EX, y:SY}, anchor{x:EX, y:EY}],
		delete(Anchor, ExtraAnchors, RemainingNewAnchors),
			% Merge to form NewAnchors (no duplicates: < instead of =<)
		merge(2, <, RemainingOldAnchors, RemainingNewAnchors, NewAnchors),
		%writeln(NewAnchors),
			% Add Article to Page
		NewAllocation = [Allocation | OldAllocations],
			% Create new Page
		update_struct(page, [anchors:NewAnchors, articles:NewAllocation], ThisPage, NewPage),
			% Terminate recursive call
		PagesOut = [NewPage | NextPages]
	;
			% ThisPage not right page
		doAllocation([Anchor, Allocation], NextPages, PagesOutTemp),
		PagesOut = [ThisPage | PagesOutTemp]
	).
	
%try(P), member(X, P), X = page{id:4999}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			INPUT CONVERSION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%convertPages: convert raw pages to structs
convertPages(_, [], []).
convertPages([NumberOfColumns, RowHeight], [ThisRawPage | OtherRawPages], ConvertOut) :-
	convertPages([NumberOfColumns, RowHeight], OtherRawPages, PagesTemp),
		% TODO: Ads, Round wegdoen
	ThisRawPage = page(id(Id), isleft(_), artikelslinks(_), margex(_), margey(_), usewidth(Width0), useheight(Height0), Ads),
	round(Width0, Width1), integer(Width1, Width), round(Height0, Height1), integer(Height1, Height),
	EmptyPageAnchors = [anchor{x:0, y:0}, anchor{x:0, y:Height}, anchor{x:Width, y:0}, anchor{x:Width, y:Height}],
	ThisConvertedPage = page{id:Id, width:Width, height:Height, anchors:EmptyPageAnchors, ads:Ads, articles:[]},
	ConvertOut = [ThisConvertedPage | PagesTemp].

%convertArticles: raw articles to structs
convertArticles([], []).
convertArticles([ThisRawArticle | OtherRawArticles], ArticlesOut) :-
	convertArticles(OtherRawArticles, ArticlesTemp),
		%
	ThisRawArticle = artikel(id(Id), type(Type), plaatsing(Plaatsing), RawLayouts),
	convertLayouts(RawLayouts, ConvertedLayouts),
	ThisConvertedArticle = article{id:Id, type:Type, plaatsing:Plaatsing, layouts:ConvertedLayouts},
	ArticlesOut = [ThisConvertedArticle | ArticlesTemp].

%convertLayouts: raw layouts to structs
convertLayouts([], []).
convertLayouts([ThisRawLayout | OtherRawLayouts], LayoutsOut) :-
	convertLayouts(OtherRawLayouts, LayoutsTemp),
		%
	ThisRawLayout = layout(id(Id), width(Width0), height(Height0)),
	round(Width0, Width1), integer(Width1, Width), round(Height0, Height1), integer(Height1, Height),
	ThisConvertedLayout = layout{id:Id, width:Width, height:Height},
	LayoutsOut = [ThisConvertedLayout | LayoutsTemp].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			FIND POSSIBLE ALLOCATIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% doArticleOnPage
doArticleOnPage(Article, [ThisPage | OtherPages],   Anchor, AllocationOnAnchor) :-
	(
			% Try to place article on ThisPage
		Article = article{id:ArtId, type:_, plaatsing:_, layouts:Layouts},
		ThisPage = page{id:PageId, width:PW, height:PH, anchors:Anchors, ads:_, articles:ArticleAllocations},
		write(' Trying Page   : '), writeln(ThisPage),
		doLayoutOnPage([PW, PH], Anchors, ArticleAllocations, Layouts,   Anchor, AllocationOnAnchor),
			%
		AllocationOnAnchor = allocation{pageid:PageId, artid:ArtId}
	;
			% Try to place article on OtherPage
		doArticleOnPage(Article, OtherPages,   Anchor, AllocationOnAnchor)
	).

% doLayoutOnPage
doLayoutOnPage([PW, PH], Anchors, ArticleAllocations, [ThisLayout | OtherLayouts],   Anchor, AllocationOnAnchor) :-
	(
			% Try ThisLayout
		ThisLayout = layout{id:Id, width:AW, height:AH},
		write('  Trying Layout : '), writeln(ThisLayout),
		doLayoutOnAnchor([PW, PH], Anchors, ArticleAllocations, [AW, AH],   Anchor, AllocationOnAnchor),
			%
		AllocationOnAnchor = allocation{layoutid:Id}
	;
			% Try OtherLayouts
		doLayoutOnPage([PW, PH], Anchors, ArticleAllocations, OtherLayouts,   Anchor, AllocationOnAnchor)
	).
	
% doLayoutOnAnchor
doLayoutOnAnchor([PW, PH], [ThisAnchor | OtherAnchors], ArticleAllocations, [AW, AH],   Anchor, AllocationOnAnchor) :-
	(
			% Try ThisAnchor
		ThisAnchor = anchor{x:SX, y:SY},
		write('   Trying Anchor : '), writeln(ThisAnchor),
		tryAnchor(_, [PW, PH], [SX, SY], ArticleAllocations, [AW, AH], AllocationOnAnchor),
		allocationScore([PW, PH], ArticleAllocations, AllocationOnAnchor, Score),
		AllocationOnAnchor = allocation{score:Score},
		write('    Score         : '), writeln(Score),
			%
		Anchor = ThisAnchor
	;
			% Try OtherAnchor
		doLayoutOnAnchor([PW, PH], OtherAnchors, ArticleAllocations, [AW, AH],   Anchor, AllocationOnAnchor)
	).

% tryAnchor DownRight
tryAnchor(dr, [PW, PH], [SX, SY], ArticleAllocations, [AW, AH],   AllocationOnAnchor) :-
	EX is SX + AW, EY is SY + AH,
	EX =< PW, EY =< PH,
	noOverlap([SX, SY], [EX, EY], ArticleAllocations),
		%
	AllocationOnAnchor = allocation{sx:SX, sy:SY, ex:EX, ey:EY},
	write('    DownRight     : '), writeln([SX, EX, SY, EY]).

% tryAnchor DownLeft
tryAnchor(dl, [PW, PH], [EX, SY], ArticleAllocations, [AW, AH],   AllocationOnAnchor) :-
	SX is EX - AW, EY is SY + AH,
	SX >= 0, EY =< PH,
	noOverlap([SX, SY], [EX, EY], ArticleAllocations),
		%
	AllocationOnAnchor = allocation{sx:SX, sy:SY, ex:EX, ey:EY},
	write('    DownLeft      : '), writeln([SX, EX, SY, EY]).

% tryAnchor UpRight
tryAnchor(ur, [PW, PH], [SX, EY], ArticleAllocations, [AW, AH],   AllocationOnAnchor) :-
	SY is EY - AH, EX is SX + AW,
	SY >= 0, EX =< PW,
	noOverlap([SX, SY], [EX, EY], ArticleAllocations),
		%
	AllocationOnAnchor = allocation{sx:SX, sy:SY, ex:EX, ey:EY},
	write('    UpRight       : '), writeln([SX, EX, SY, EY]).	

% tryAnchor UpLeft
tryAnchor(ul, [PW, PH], [EX, EY], ArticleAllocations, [AW, AH],   AllocationOnAnchor) :-
	SX is EX - AW, SY is EY - AH,
	SX >= 0, SY >= 0,
	noOverlap([SX, SY], [EX, EY], ArticleAllocations),
		%
	AllocationOnAnchor = allocation{sx:SX, sy:SY, ex:EX, ey:EY},
	write('    UpLeft        : '), writeln([SX, EX, SY, EY]).

% noOverlap. Check if the given rectangle does not overlap with any other articles already allocated.
noOverlap([NASX, NASY], [NAEX, NAEY], [ThisArticleAllocation | OtherArticleAllocations]) :-
	ThisArticleAllocation = allocation{sx:OASX, sy:OASY, ex:OAEX, ey:OAEY},
	not(checkNoOverlap([NASX, NASY], [NAEX, NAEY], [OASX, OASY], [OAEX, OAEY])),
	noOverlap([NASX, NASY], [NAEX, NAEY], OtherArticleAllocations).
noOverlap(_, _, []).

%checkOverlap w/ 4 overloads: Check if two given rectangles ([NASX, NASY], [NAEX, NAEY] ; [OASX, OASY], [OAEX, OAEY]) overlap
checkNoOverlap(_, [NAEX, _], [OASX, _], _) :- NAEX =< OASX, !, fail.
checkNoOverlap(_, [_, NAEY], [_, OASY], _) :- NAEY =< OASY, !, fail.
checkNoOverlap([NASX, _], _, _, [OAEX, _]) :- NASX >= OAEX, !, fail.
checkNoOverlap([_, NASY], _, _, [_, OAEY]) :- NASY >= OAEY, !, fail.
checkNoOverlap(_, _, _, _).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			HEURISTIC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%test(S) :-
%	R  = allocation{sx:0,  sy:0,    ex:10, ey:10},
%	R0 = allocation{sx:10, sy:0, 	ex:20, ey:5},	S0 = 5,
%	R1 = allocation{sx:10, sy:3, 	ex:20, ey:6},	S1 = 3,
%	R2 = allocation{sx:10, sy:7, 	ex:20, ey:12},	S2 = 3,
%	R3 = allocation{sx:10, sy:15, 	ex:20, ey:20},	S3 = 0,
%		%
%	allocationScore([0,0], [R], R3, S).
	
% allocationScore with other articles
allocationScore([PW, PH], [ExistingAllocation | OtherAllocations], NewAllocation, Score) :-
	allocationScore([PW, PH], OtherAllocations, NewAllocation, Score0),
		%
	allocationScore(ExistingAllocation, NewAllocation, Score1),
	Score is Score0 + Score1.

% allocationScore with paper border
allocationScore([PW, PH], [], NewAllocation, Score) :-
	Paper = allocation{sx:0, sy:0, ex:PW, ey:PH},
	allocationScore(Paper, NewAllocation, Score).

% allocationScore of two allocations
allocationScore(ExistingAllocation, NewAllocation, Score) :-
	NewAllocation		= allocation{sx:SX0, sy:SY0, ex:EX0, ey:EY0},
	getLines([SX0, SY0], [EX0, EY0], NewAllocationLines),
		%
	ExistingAllocation 	= allocation{sx:SX1, sy:SY1, ex:EX1, ey:EY1},
	getLines([SX1, SY1], [EX1, EY1], ExistingAllocationLines),
		%
	NewAllocationLines 		= [HU0, VL0, HD0, VR0],
	ExistingAllocationLines = [HU1, VL1, HD1, VR1],
		%
	Possibilities = [ [HU0, HU1], [HU0, HD1], [HD0, HU1], [HD0, HD1], [VL0, VL1], [VL0, VR1], [VR0, VL1], [VR0, VR1] ],
	(
		foreach([L1, L2], Possibilities),
		foreach(Length, LengthList)
	do
		%print_list([L1, L2]),
		intersectionLength(L1, L2, Length)
		%writeln(Length)
	),
	Score is sum(LengthList).

%	intersectionLength([SX0, SY0], [EX0, EY0], [SX1, SY1], [EX1, EY1], Length),
	%Length is 0,
%	Score is ScoreTemp + Length.


getLines([SX, SY], [EX, EY], [[[SX, SY],[EX,SY]], [[SX,SY],[SX,EY]], [[SX,EY],[EX,EY]], [[EX,SY],[EX,EY]]]).

% Horizontal: SY0 = EY0 = SY1 = EY1
intersectionLength([[SX0, Y],[EX0, Y]], [[SX1, Y],[EX1, Y]], Length) :- !,
	intersectionLength(SX0, EX0, SX1, EX1, Length).
% Vertical: SX0 = SY0 = EX0 = EY0
intersectionLength([[X, SY0],[X, EY0]], [[X, SY1],[X, EY1]], Length) :- !,
	intersectionLength(SY0, EY0, SY1, EY1, Length).
% Orthogonal
intersectionLength([[_, _],[_, _]], [[_, _],[_, _]], 0) :- !.
	%
intersectionLength(SX0, EX0, SX1, EX1, Length) :-
	EX0 =< SX1, !,
	Length = 0.
intersectionLength(SX0, EX0, SX1, EX1, Length) :-
	SX0 =< SX1, EX0 >= SX1, EX0 =< EX1, !,
	Length is EX0 - SX1.
intersectionLength(SX0, EX0, SX1, EX1, Length) :-
	SX1 < SX0, EX0 < EX1, !,
	Length is EX0 - SX0.
intersectionLength(SX0, EX0, SX1, EX1, Length) :- !,
	intersectionLength(SX1, EX1, SX0, EX0, Length).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			RUBBISH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% noOverlap. Check if the given rectangle does not overlap with any other articles already allocated.
%noOverlap([NASX, NASY], [NAEX, NAEY], [ThisArticleAllocation | OtherArticleAllocations]) :-
%	ThisArticleAllocation = allocation{sx:OASX, sy:OASY, ex:OAEX, ey:OAEY},
%	checkOverlap([NASX, NASY], [NAEX, NAEY], [OASX, OASY], [OAEX, OAEY]),
%	noOverlap([NASX, NASY], [NAEX, NAEY], OtherArticleAllocations).
%noOverlap(_, _, []).
%
%%checkOverlap w/ 4 overloads: Check if two given rectangles ([NASX, NASY], [NAEX, NAEY] ; [OASX, OASY], [OAEX, OAEY]) overlap
%checkOverlap(_, [NAEX, _], [OASX, _], _) :- NAEX =< OASX, !.
%checkOverlap(_, [_, NAEY], [_, OASY], _) :- NAEY =< OASY, !.
%checkOverlap([NASX, _], _, _, [OAEX, _]) :- NASX >= OAEX, !.
%checkOverlap([_, NASY], _, _, [_, OAEY]) :- NASY >= OAEY, !.
%checkOverlap(_, _, _, _) 				 :- fail.

exportToMatlab([ThisPage | OtherPages], Matlab) :-
	exportToMatlab(OtherPages, Matlab0),
	ThisPage = page{articles:Articles},
	(
		foreach(allocation{sx:SX, sy:SY, ex:EX, ey:EY}, Articles),
		foreach(X, L)
	do
		X = [SX, SY, EX, EY]
	),
	Matlab = [L | Matlab0].
exportToMatlab([], []).


%writeXml(Document) :-
%	File = '/Users/wouter/Desktop/Cronos/data.xml',
%	open(File, read, Stream),
%	read_string(Stream, end_of_file, _, Utf8String),
%	close(Stream),
%	string_list(Utf8String, Chars, utf8),
%	xml_parse(Chars, Document).
	
%	Xml = xml(	[version='1.0', standalone='no'],
%			  	[
%			    doctype( svg, public( '-//W3C//DTD SVG 1.0//EN', 'http://www.w3.org/.../svg10.dtd' ) ),
%			    namespace( 'http://www.w3.org/2000/svg', '',
%			        element( svg,
%			            [width='500', height='500'],
%			            [
%			            element( circle,
%			                [cx='25', cy='25', r='24', style='fill: red; stroke: blue; stroke-width: 1'],
%			                [] )
%			            ] )
%			        )
%			    ] ),

%	Xml = "xml([version='1.0'], [])",
%	string_list(Xml, Xml1, bytes),
%
%	xml_parse(Xml1, xml([], [pcdata(Page1)])),
%	string_list(Page, Page1, utf8)	.










	
%		
%
%%doArticle: Allocate a new article on the page
%%[PW, PH]: PageSize, OldArtAlloc: Previously allocated articls, NewArtAlloc (out): newly allocated articles, ThisArt: current article, OtherArts: other articles
%doArticle([PW, PH], OldArtAlloc, NewArtAlloc, [ThisArt | OtherArts]) :-
%	write('Placing: '), writeln(ThisArt),
%	getLayouts(ThisArt, Layouts),
%	doLayout([PW, PH], OldArtAlloc, InterArtAlloc, ThisArt, Layouts),
%		%Tail recursion call
%	doArticle([PW, PH], InterArtAlloc, NewArtAlloc, OtherArts).
%doArticle(_, A, A, []).
%
%%doLayout: [PW, PH]: PageSize, OldArtAlloc: Previously allocated articls, NewArtAlloc (out): newly allocated articles, Article: Article, [Layout|OtherLayouts]: all possible layouts 
%doLayout([PW, PH], OldArtAlloc, NewArtAlloc, Article, [Layout | OtherLayouts]) :-
%	(
%			%Allocate Free Space
%		getLayoutSize(Layout, LW, LH),
%		getFreeSpace([PW, PH], OldArtAlloc, [LW, LH], [1, 1], [SX, SY]),
%		EX is SX + LW - 1, EY is SY + LH - 1,
%			%Check validity of Space
%		getArticleType(Article, Type),
%		isValidLocation([PW, PH], [SX, SY], [EX, EY], Type),
%			%Actual allocation on page
%		getLayoutId(Layout, LayoutId),
%		NewArtAlloc = [ [LayoutId, [SX, SY], [EX, EY]] | OldArtAlloc],
%		write('Placed: '), write(LayoutId), write(' '), writeln([SX, EX, SY, EY])
%	;
%			%If allocation of free space, validity of space fails, try another layout
%		doLayout([PW, PH], OldArtAlloc, NewArtAlloc, Article, OtherLayouts)
%	).
%doLayout(_, A, A, _, []) :- writeln('Not placed').
%
%
%%getFreeSpace([PW, PH], ArtAlloc, [NeedX, NeedY], [SX, SY], [SX1, SY1]) :-
%%	(
%%			%Check if current rectangle fits on page
%%		EX is SX + NeedX - 1, EY is SY + NeedY - 1,
%%		EX =< PX, EY =< PY,
%%	;
%%			%Coordinates do not fit on page: try next line
%%		getFreeSpace([PW, PH], ArtAlloc
%%	
%%	).
%		
%%getFreeSpace: [PX, PY] PageSize, [NeedX, NeedY] ArticleSize, [SX, SY] InitialStartCoord, [SX1, SY1]
%getFreeSpace([PX, PY], OldArtAlloc, [NeedX, NeedY], [SX, SY], [SX1, SY1]) :-
%	(
%		EX is SX + NeedX - 1,
%		EY is SY + NeedY - 1,
%		EX =< PX,
%		EY =< PY,
%		checkOverlap(OldArtAlloc, [SX, SY], [EX, EY]),
%		SX1 is SX, SY1 is SY
%	;
%		nextStart(PX, PY, SX, SY, SX0, SY0),
%		getFreeSpace([PX, PY], OldArtAlloc, [NeedX, NeedY], [SX0, SY0], [SX1, SY1])
%	).
%
%%nextStart: PW, PH: PageSize, SX1, SY1: Current bad start coord, SX2, SY2 new start coord to try with
%nextStart(PW, PH, PW, PH, _, _) 		:- !, fail.
%nextStart(PW, _, PW, SY1, 1, SY2) 		:- !, SY2 is SY1 + 1.
%nextStart(_, _, SX1, SY1, SX2, SY1) 	:- SX2 is SX1 + 1.	
%
%%checkOverlap: [NASX, NASY] NewArtStartCoord, [NAEX, NAEY]: NewArtEndCoord, [OASX, OASY] OldArtStartCoord, [OAEX, OAEY]: OldArtEndCoord
%%Check if the new article would overlap with an existing article
%%checkOverlap([], _, _).
%%checkOverlap([Arts | OtherArts], [NASX, NASY], [NAEX, NAEY]) :-
%%	Arts = [_, [OASX, OASY], [OAEX, OAEY]],
%%	checkOverlap([NASX, NASY], [NAEX, NAEY], [OASX, OASY], [OAEX, OAEY]),
%%	checkOverlap(OtherArts, [NASX, NASY], [NAEX, NAEY]).
%%
%%checkOverlap w/ 4 overloads: Check if two given rectangles ([NASX, NASY], [NAEX, NAEY] ; [OASX, OASY], [OAEX, OAEY]) overlap
%%checkOverlap(_, [NAEX, _], [OASX, _], _) :- NAEX < OASX, !.
%%checkOverlap(_, [_, NAEY], [_, OASY], _) :- NAEY < OASY, !.
%%checkOverlap([NASX, _], _, _, [OAEX, _]) :- NASX > OAEX, !.
%%checkOverlap([_, NASY], _, _, [_, OAEY]) :- NASY > OAEY, !.
%
%%isValidLocation: 'Kopstuk' should be placed on the first line. Others can be placed everywhere (see overload)
%% Syntax: [PW, PH], [SX, SY], [EX, EY]
%isValidLocation(_, [_, SY], _, kopstuk) :- !, SY == 1.
%isValidLocation(_, _, _, _).
%
%getArticleType(Article, Type) :-
%	Article = artikel(_, type(Type), _, _).
%	
%getLayouts(Article, Layouts) :-
%	Article = artikel(_, _, _, Layouts).
%
%getLayoutSize(Layout, Width, Height) :-
%	Layout = layout(_, width(Width), height(Height)).
%
%getLayoutId(Layout, Id) :-
%	Layout = layout(id(Id), _, _).
%	
%%convertArticles
%convertArticles(PW, PH, GW, GH, Art, ArtOut) :-
%	GWUnit is PW / GW,
%	GHUnit is PH / GH,
%	(
%		foreachelem(ThisArticle, Art),
%		param(GWUnit, GHUnit)
%	do
%		getLayouts(ThisArticle, Layout),
%		(
%			foreachelem(ThisLayout, Layout),
%			param(GWUnit, GHUnit)
%		do
%			getLayoutSize(ThisLayout, W0, H0),
%			W1 is integer(ceiling(W0 / GWUnit)),
%			H1 is integer(ceiling(H0 / GHUnit)),
%			setarg(2, ThisLayout, width(W1)),
%			setarg(3, ThisLayout, height(H1))
%		),
%		flatten_array(Layout, DD),
%		setarg(4, ThisArticle, DD)
%	),
%	flatten_array(Art, ArtOut).
%
%%printPage: [PW, PH] PageSize, Alloc Allocated Articles. Print the allocated articles visually.
%printPage([PW, PH], Alloc) :-
%	dim(Page, [PW, PH]),
%	(
%		foreach([Id, [SX, SY], [EX, EY]], Alloc),
%		param(Page)
%	do
%		(
%			multifor([X, Y], [SX, SY], [EX, EY]),
%			param(Page, Id)
%		do
%			subscript(Page, [X, Y], Id)
%		)
%	),
%	(
%		multifor([Y,X], [1,1], [PH, PW]),
%		param(Page)
%	do
%		( X == 1 -> nl ; true ), write(' '),
%		(
%			A is subscript(Page, [X,Y]), ground(A), !, write(A)
%		;
%			write('.....')
%		)
%	), nl.
%	
%	
%	
%	
%	
	
	
%	convertArticles(PW, PH, GW, GH, Art, ArtOut) :-
%	GWUnit is PW / GW,
%	GHUnit is PH / GH,
%	(
%		foreachelem(ThisArticle, Art),
%		param(GWUnit, GHUnit)
%	do
%		getLayouts(ThisArticle, Layout),
%		(
%			foreachelem(ThisLayout, Layout),
%			param(GWUnit, GHUnit)
%		do
%			getLayoutSize(ThisLayout, W0, H0),
%			W1 is integer(ceiling(W0 / GWUnit)),
%			H1 is integer(ceiling(H0 / GHUnit)),
%			setarg(2, ThisLayout, width(W1)),
%			setarg(3, ThisLayout, height(H1))
%		),
%		flatten_array(Layout, DD),
%		setarg(4, ThisArticle, DD)
%	),
%	flatten_array(Art, ArtOut).


% Redefining a built-in predicate:
%    :- module(m)
%    :- local writeln/1.   % stop writeln/1 from being imported
%
%    main :-
%       writeln(hello).    % local-declaration must be before this use!
%
%    writeln(X) :-         % the local version
%       printf("I don't like the normal writeln/1 predicate: %w%n",[X]).
	