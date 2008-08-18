:- include(artikels_hln4).

%:- lib(xml).

:- lib(branch_and_bound).

% Structures preamble
:- local
		struct(pagein(id, isleft, artikelslinks, margex, margey, usewidth, useheight, ads)),
			%
		struct(page(id, pageposition, width, height, anchors, articles)),
		struct(ad(id, x, y, width, height)),
		struct(article(id, type, plaatsing, layouts)),
		struct(layout(id, width, height)),
		struct(allocation(pageid, artid, layoutid, sx, sy, ex, ey, score)),
		struct(anchor(x, y)).
	
try(Pages) :-
	loadPages(RawPages),
	loadArticles(RawArticles),
	doLayout(RawPages, RawArticles, Pages).
	
doLayout(PagesIn, ArticlesIn, PagesOut) :-
	PageCount is length(PagesIn),
	convertPages(PagesIn, 1, PageCount, ConvertedPages),
		%
	convertArticles(ArticlesIn, ConvertedArticles),
		%
	doArticles(ConvertedArticles, ConvertedPages, PagesOut),
	nl, printMatlab(ConvertedArticles, PagesOut), nl, writeln(Score).

%try(Pages) :-
%		% Load Pages
%	loadPages(RawPages),
%	PageCount is length(RawPages),
%	convertPages(RawPages, 1, PageCount, ConvertedPages),
%	%print_list(ConvertedPages),
%		% Load Articles
%	loadArticles(RawArticles),
%	convertArticles(RawArticles, ConvertedArticles),
%		% Do Layout
%	%ConvertedPages = [FirstPage | _],
%	%ConvertedArticles = [FirstArticle | _],
%	%doArticles(ConvertedArticles, ConvertedPages, Pages, 0, Score),
%	doArticles(ConvertedArticles, ConvertedPages, Pages),
%	nl, printMatlab(ConvertedArticles, Pages), nl, writeln(Score).

%doArticles([], X, X, Y, Y).
%doArticles(Articles, EmptyPages, FilledPages, ScoreIn, ScoreOut) :-
%	(
%		member(ThisArticle, Articles),
%		doArticleOnPage(ThisArticle, EmptyPages,  Anchor, AllocationOnAnchor),
%		AllocationOnAnchor = allocation{score:Score},
%		ScoreTemp is ScoreIn + Score,
%		doAllocation([Anchor, AllocationOnAnchor], EmptyPages, PagesWithThisArticle),
%		delete(ThisArticle, Articles, OtherArticles),
%			%
%		writeln('***** Allocation of Article *****'),
%		write('Article    : '), writeln(ThisArticle),
%		write('Allocation : '), writeln([Anchor, AllocationOnAnchor]),
%		write('Score      : '), writeln(Score),
%		write('Result     : '), writeln(PagesWithThisArticle),
%		write('Remaining  : '), writeln(OtherArticles),
%			%
%		doArticles(OtherArticles, PagesWithThisArticle, FilledPages, ScoreTemp, ScoreOut)
%	;
%		!, (
%			writeln('Failed to place article'),
%			delete(ThisArticle, Articles, OtherArticles),
%			doArticles(OtherArticles, EmptyPages, FilledPages, ScoreIn, ScoreOut)
%		;
%			fail
%		)
%	).

% doArticles
doArticles([], X, X).
doArticles(Articles, EmptyPages, FilledPages) :-
	(
			% Find article with highest adjacency score and place it next
		bb_min((
			member(ThisArticle, Articles),
			custWrite(article, 'Trying Article: '), custWriteln(article, ThisArticle),
			doArticleOnPage(ThisArticle, EmptyPages,   Anchor, AllocationOnAnchor),
			AllocationOnAnchor = allocation{score:Score},
			Cost is Score * -1), 
			%Cost is 0),
			Cost, bb_options{strategy:continue}),
			%
		BestAllocation = [Anchor, AllocationOnAnchor],
		subtract(Articles, [ThisArticle], OtherArticles),
			%
		doAllocation(BestAllocation, EmptyPages, PagesWithThisArticle),
		writeln('***** Allocation of Article *****'),
		write('Article    : '), writeln(ThisArticle),
		write('Allocation : '), writeln(BestAllocation),
		write('Score      : '), writeln(Score),
		write('Result     : '), writeln(PagesWithThisArticle),
		write('Remaining  : '), writeln(OtherArticles)
	; 
		writeln('Failed to place article'),
		subtract(Articles, [ThisArticle], OtherArticles),
		PagesWithThisArticle = EmptyPages
	),
		% Place next article
	doArticles(OtherArticles, PagesWithThisArticle, FilledPages).

% doAllocation: actually allocate this Allocation on this Anchor on ThisPage
doAllocation([Anchor, Allocation], [ThisPage | NextPages], PagesOut) :-
	(
			% Find right Page
		Allocation = allocation{pageid:Id},
		ThisPage = page{id:Id}, !,
			% Remove anchor where the article was added
		ThisPage = page{anchors:OldAnchors, articles:OldAllocations},
		Allocation = allocation{sx:SX, sy:SY, ex:EX, ey:EY},
			% This article anchors
		ExtraAnchors = [anchor{x:SX, y:SY}, anchor{x:SX, y:EY}, anchor{x:EX, y:SY}, anchor{x:EX, y:EY}],
			% Merge to form NewAnchors (no duplicates: < instead of =<)
		merge(0, <, OldAnchors, ExtraAnchors, NewAnchors),
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
convertPages([], _, _, []).
convertPages([ThisRawPage | OtherRawPages], ThisPageNr, PageCount, ConvertOut) :-
	NextPageNr is ThisPageNr + 1,
	convertPages(OtherRawPages, NextPageNr, PageCount, PagesTemp),
		% TODO: Ads, Round wegdoen
	ThisRawPage = pagein{id:Id, isleft:_, artikelslinks:_, margex:_, margey:_, usewidth:Width0, useheight:Height0, ads:Ads},
		round(Width0, Width1), integer(Width1, Width), round(Height0, Height1), integer(Height1, Height),
	EmptyPageAnchors = [anchor{x:0, y:0}, anchor{x:0, y:Height}, anchor{x:Width, y:0}, anchor{x:Width, y:Height}],
		% Where is the page placed relative to other pages (ex. 4 pages: Begin = [0, 1/3, 2/3, 1] = Last)
	(PageCount = 1 -> PagePosition is 0 ; PagePosition is (ThisPageNr - 1) / (PageCount - 1)),
	ThisConvertedPage = page{id:Id, pageposition:PagePosition, width:Width, height:Height, anchors:EmptyPageAnchors, articles:[]},
		% Do Ads
	putAds(Ads, ThisConvertedPage, ThisConvertedPage0),
	ConvertOut = [ThisConvertedPage0 | PagesTemp].

%put ThisAd on the PageIn, resulting in PageOut
putAds([ThisAd | OtherAds], PageIn, PageOut) :-
	ThisAd = ad{id:AdId, x:X0, y:Y0, width:Width0, height:Height0},
	round(X0, X1), integer(X1, SX), round(Y0, Y1), integer(Y1, SY), round(Width0, Width1), integer(Width1, Width), round(Height0, Height1), integer(Height1, Height),
		% Allocate Adspace
	PageIn = page{id:PageId, articles:OldAllocations},
	EX is SX + Width, EY is SY + Height,
	Allocation = allocation{pageid:PageId, artid:AdId, layoutid:0, sx:SX, sy:SY, ex:EX, ey:EY, score:0},
	update_struct(page, [articles:[Allocation | OldAllocations]], PageIn, PageTemp),
		%
	putAds(OtherAds, PageTemp, PageOut).
putAds([], A, A).

%convertArticles: raw articles to structs
convertArticles([], []).
convertArticles([ThisRawArticle | OtherRawArticles], ArticlesOut) :-
	convertArticles(OtherRawArticles, ArticlesTemp),
		%
	ThisRawArticle = article{layouts:RawLayouts},
	convertLayouts(RawLayouts, ConvertedLayouts),
	update_struct(article, [layouts:ConvertedLayouts], ThisRawArticle, ThisConvertedArticle),
	ArticlesOut = [ThisConvertedArticle | ArticlesTemp].

%convertLayouts: raw layouts to structs
convertLayouts([], []).
convertLayouts([ThisRawLayout | OtherRawLayouts], LayoutsOut) :-
	convertLayouts(OtherRawLayouts, LayoutsTemp),
		%
	ThisRawLayout = layout{width:Width0, height:Height0},
	round(Width0, Width1), integer(Width1, Width), round(Height0, Height1), integer(Height1, Height),
	update_struct(layout, [width:Width, height:Height], ThisRawLayout, ThisConvertedLayout),
	LayoutsOut = [ThisConvertedLayout | LayoutsTemp].

%%convertPages: convert raw pages to structs
%convertPages([], _, _, []).
%convertPages([ThisRawPage | OtherRawPages], ThisPageNr, PageCount, ConvertOut) :-
%	NextPageNr is ThisPageNr + 1,
%	convertPages(OtherRawPages, NextPageNr, PageCount, PagesTemp),
%		% TODO: Ads, Round wegdoen
%	ThisRawPage = page(id(Id), isleft(_), artikelslinks(_), margex(_), margey(_), usewidth(Width0), useheight(Height0), Ads),
%		round(Width0, Width1), integer(Width1, Width), round(Height0, Height1), integer(Height1, Height),
%	EmptyPageAnchors = [anchor{x:0, y:0}, anchor{x:0, y:Height}, anchor{x:Width, y:0}, anchor{x:Width, y:Height}],
%		% Where is the page placed relative to other pages (ex. 4 pages: Begin = [0, 1/3, 2/3, 1] = Last)
%	(PageCount = 1 -> PagePosition is 0 ; PagePosition is (ThisPageNr - 1) / (PageCount - 1)),
%	ThisConvertedPage = page{id:Id, pageposition:PagePosition, width:Width, height:Height, anchors:EmptyPageAnchors, articles:[]},
%		% Do Ads
%	putAds(Ads, ThisConvertedPage, ThisConvertedPage0),
%	ConvertOut = [ThisConvertedPage0 | PagesTemp].
%
%%put ThisAd on the PageIn, resulting in PageOut
%putAds([ThisAd | OtherAds], PageIn, PageOut) :-
%	ThisAd = ad(id(AdId), x(X0), y(Y0), width(Width0), height(Height0)),
%		% TODO: Round wegdoen
%	round(X0, X1), integer(X1, SX), round(Y0, Y1), integer(Y1, SY), round(Width0, Width1), integer(Width1, Width), round(Height0, Height1), integer(Height1, Height),
%		% Allcate Adspace
%	PageIn = page{id:PageId, articles:OldAllocations},
%	%Anchor = anchor{x:SX, y:SY},
%	EX is SX + Width, EY is SY + Height,
%	Allocation = allocation{pageid:PageId, artid:AdId, layoutid:0, sx:SX, sy:SY, ex:EX, ey:EY, score:0},
%	%doAllocation([Anchor, Allocation], [PageIn], [PageTemp]),
%	update_struct(page, [articles:[Allocation | OldAllocations]], PageIn, PageTemp),
%		%
%	putAds(OtherAds, PageTemp, PageOut).
%putAds([], A, A).	
%
%convertArticles: raw articles to structs
%convertArticles([], []).
%convertArticles([ThisRawArticle | OtherRawArticles], ArticlesOut) :-
%	convertArticles(OtherRawArticles, ArticlesTemp),
%		
%	ThisRawArticle = artikel(id(Id), type(Type), plaatsing(Plaatsing), RawLayouts),
%	convertLayouts(RawLayouts, ConvertedLayouts),
%	ThisConvertedArticle = article{id:Id, type:Type, plaatsing:Plaatsing, layouts:ConvertedLayouts},
%	ArticlesOut = [ThisConvertedArticle | ArticlesTemp].
%
%convertLayouts: raw layouts to structs
%convertLayouts([], []).
%convertLayouts([ThisRawLayout | OtherRawLayouts], LayoutsOut) :-
%	convertLayouts(OtherRawLayouts, LayoutsTemp),
%		
%	ThisRawLayout = layout(id(Id), width(Width0), height(Height0)),
%	round(Width0, Width1), integer(Width1, Width), round(Height0, Height1), integer(Height1, Height),
%	ThisConvertedLayout = layout{id:Id, width:Width, height:Height},
%	LayoutsOut = [ThisConvertedLayout | LayoutsTemp].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			FIND POSSIBLE ALLOCATIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% doArticleOnPage
doArticleOnPage(Article, [ThisPage | OtherPages],   Anchor, AllocationOnAnchor) :-
	(
			% Try to place article on ThisPage
		Article = article{id:ArtId, type:ArtType, plaatsing:ArtPlace, layouts:Layouts},
		ThisPage = page{id:PageId, pageposition:PagePosition, width:PW, height:PH, anchors:Anchors, articles:ArticleAllocations},
		(isValidArticlePlacement(ArtPlace, PagePosition)),
		custWrite(page, ' Trying Page   : '), custWriteln(page, ThisPage),
		doLayoutOnPage([PW, PH], ArtType, Anchors, ArticleAllocations, Layouts,   Anchor, AllocationOnAnchor),
			%
		AllocationOnAnchor = allocation{pageid:PageId, artid:ArtId}
	;
			% Try to place article on OtherPage
		doArticleOnPage(Article, OtherPages,   Anchor, AllocationOnAnchor)
	).

% isValidArticlePlacement. BusinessRule: Articles VOORAAN niet ACHTERAAN zetten
isValidArticlePlacement(v, 1.0) :- 
	!, fail.
% isValidArticlePlacement. BusinessRule: Articles ACHTERAAN niet VOORAAN zetten	
isValidArticlePlacement(a, 0.0) :-
	!, fail.
isValidArticlePlacement(_, _).
	
% doLayoutOnPage
doLayoutOnPage([PW, PH], ArticleType, Anchors, ArticleAllocations, [ThisLayout | OtherLayouts],   Anchor, AllocationOnAnchor) :-
	(
			% Try ThisLayout
		ThisLayout = layout{id:Id, width:AW, height:AH},
		custWrite(layout, '  Trying Layout : '), custWriteln(layout, ThisLayout),
		doLayoutOnAnchor([PW, PH], ArticleType, Anchors, ArticleAllocations, [AW, AH],   Anchor, AllocationOnAnchor),
			%
		AllocationOnAnchor = allocation{layoutid:Id}
	;
			% Try OtherLayouts
		doLayoutOnPage([PW, PH], ArticleType, Anchors, ArticleAllocations, OtherLayouts,   Anchor, AllocationOnAnchor)
	).
	
% doLayoutOnAnchor
doLayoutOnAnchor([PW, PH], ArticleType, [ThisAnchor | OtherAnchors], ArticleAllocations, [AW, AH],   Anchor, AllocationOnAnchor) :-
	(
			% Try ThisAnchor
		ThisAnchor = anchor{x:SX, y:SY},
		custWrite(anchor, '   Trying Anchor : '), custWriteln(anchor, ThisAnchor),
		tryAnchor(_, [PW, PH], ArticleType, [SX, SY], ArticleAllocations, [AW, AH], AllocationOnAnchor),
		allocationScore([PW, PH], ArticleAllocations, AllocationOnAnchor, Score),
		AllocationOnAnchor = allocation{score:Score},
		%write('    Score         : '), writeln(Score),
			%
		Anchor = ThisAnchor
	;
			% Try OtherAnchor
		doLayoutOnAnchor([PW, PH], ArticleType, OtherAnchors, ArticleAllocations, [AW, AH],   Anchor, AllocationOnAnchor)
	).

% tryAnchor DownRight
tryAnchor(dr, [PW, PH], ArticleType, [SX, SY], ArticleAllocations, [AW, AH],   AllocationOnAnchor) :-
	EX is SX + AW, EY is SY + AH,
	EX =< PW, EY =< PH,
	noOverlap([SX, SY], [EX, EY], ArticleAllocations),
	AllocationOnAnchor = allocation{sx:SX, sy:SY, ex:EX, ey:EY},
	isValidArticleTypeAllocation(AllocationOnAnchor, ArticleType),
		%
	custWrite(direction, '    DownRight     : '), custWriteln(direction, [SX, EX, SY, EY]).

% tryAnchor DownLeft
tryAnchor(dl, [_, PH], ArticleType, [EX, SY], ArticleAllocations, [AW, AH],   AllocationOnAnchor) :-
	SX is EX - AW, EY is SY + AH,
	SX >= 0, EY =< PH,
	noOverlap([SX, SY], [EX, EY], ArticleAllocations),
	AllocationOnAnchor = allocation{sx:SX, sy:SY, ex:EX, ey:EY},
	isValidArticleTypeAllocation(AllocationOnAnchor, ArticleType),
		%
	custWrite(direction, '    DownLeft      : '), custWriteln(direction, [SX, EX, SY, EY]).

% tryAnchor UpRight
tryAnchor(ur, [PW, _], ArticleType, [SX, EY], ArticleAllocations, [AW, AH],   AllocationOnAnchor) :-
	SY is EY - AH, EX is SX + AW,
	SY >= 0, EX =< PW,
	noOverlap([SX, SY], [EX, EY], ArticleAllocations),
	AllocationOnAnchor = allocation{sx:SX, sy:SY, ex:EX, ey:EY},
	isValidArticleTypeAllocation(AllocationOnAnchor, ArticleType),
		%
	custWrite(direction, '    UpRight       : '), custWriteln(direction, [SX, EX, SY, EY]).	

% tryAnchor UpLeft
tryAnchor(ul, _, ArticleType, [EX, EY], ArticleAllocations, [AW, AH],   AllocationOnAnchor) :-
	SX is EX - AW, SY is EY - AH,
	SX >= 0, SY >= 0,
	noOverlap([SX, SY], [EX, EY], ArticleAllocations),
	AllocationOnAnchor = allocation{sx:SX, sy:SY, ex:EX, ey:EY},
	isValidArticleTypeAllocation(AllocationOnAnchor, ArticleType),
		%
	custWrite(direction, '    UpLeft        : '), custWriteln(direction, [SX, EX, SY, EY]).

% isValidAllocation. BusinessRule: Kopstukken beginnen alleen op SY==0
isValidArticleTypeAllocation(Allocation, kopstuk) :- !,
	Allocation = allocation{sy:0}.
isValidArticleTypeAllocation(_, _).

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
		intersectionLength(L1, L2, Length)
	),
	Score is sum(LengthList).

% getLines: get the line segments of a rectangle (4 per rectangle)
getLines([SX, SY], [EX, EY], [[[SX, SY],[EX,SY]], [[SX,SY],[SX,EY]], [[SX,EY],[EX,EY]], [[EX,SY],[EX,EY]]]).

% Horizontal: SY0 = EY0 = SY1 = EY1
intersectionLength([[SX0, Y],[EX0, Y]], [[SX1, Y],[EX1, Y]], Length) :- !,
	intersectionLength(SX0, EX0, SX1, EX1, Length).
% Vertical: SX0 = SY0 = EX0 = EY0
intersectionLength([[X, SY0],[X, EY0]], [[X, SY1],[X, EY1]], Length) :- !,
	intersectionLength(SY0, EY0, SY1, EY1, Length).
% Orthogonal
intersectionLength([[_, _],[_, _]], [[_, _],[_, _]], 0) :- !.

% Special case: two exact same sizes together get a higher score
intersectionLength(S, E, S, E, Length) :- !,
	%Length is (E - S) ^ 2.
	Length is (E - S) ^ 1.2 * 3.
intersectionLength(_, EX0, SX1, _, Length) :-
	EX0 =< SX1, !,
	Length = 0.
intersectionLength(SX0, EX0, SX1, EX1, Length) :-
	SX0 =< SX1, EX0 >= SX1, EX0 =< EX1, !,
	Length is (EX0 - SX1) ^ 1.2.
intersectionLength(SX0, EX0, SX1, EX1, Length) :-
	SX1 < SX0, EX0 < EX1, !,
	Length is (EX0 - SX0) ^ 1.2.
intersectionLength(SX0, EX0, SX1, EX1, Length) :- !,
	intersectionLength(SX1, EX1, SX0, EX0, Length).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			CUSTOM WRITELN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
custWrite(article,	A)	:- true. %write(A).
custWrite(page, 	A)	:- true. %write(A). 
custWrite(layout,	A)	:- true. %write(A).
custWrite(anchor, 	A)	:- true. %write(A).
custWrite(direction,A) 	:- true. %write(A).
custWriteln(T, A)	 	:- custWrite(T, A), custWrite(T, '\n').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			RUBBISH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

printMatlab(AllArts, [ThisPage | OtherPages]) :-
	ThisPage = page{articles:Articles},
	write('P'), 
	B is 5 - length([ThisPage | OtherPages]), 
	write(B), 
	write(' = ['),
	%reverse(Articles, Articles0),
	printMatlabPage(AllArts, Articles),
	writeln('];'),
		%
	printMatlab(AllArts, OtherPages).
printMatlab(_, []).	

printMatlabPage(AllArts, [ThisArticle | OtherArticles]) :-
	ThisArticle = allocation{artid:Id, layoutid:LId, sx:SX, sy:SY, ex:EX, ey:EY},
	( LId = 0 -> Type=0 ; getType(AllArts, Id, Type)),
	write([Id, SX, SY, EX, EY, Type]), 
	(length(OtherArticles, 0) -> true ; write('; ')),
	printMatlabPage(AllArts, OtherArticles).
printMatlabPage(_, []).

getType(AllArts, Id, Type) :-
	member(X, AllArts), X = article{id:Id, type:Type0}, getTypeCode(Type0, Type).

getTypeCode(ad, 0).
getTypeCode(kopstuk, 1).
getTypeCode(normaal, 2).
getTypeCode(kortje, 3).


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
