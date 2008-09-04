:- include(artikels_hln20).

:- lib(branch_and_bound).

% Structures preamble
:- local
		struct(pagein(id, kopstukid, isleft, artikelslinks, margex, margey, usewidth, useheight, basislijnhoogte, ads)),
		struct(ad(id, x, y, width, height)),
		struct(article(id, type, plaatsing, kader, layouts)),
		struct(layout(id, width, height, components, photos)),
		struct(component(type, font, fontsize, x, y, eindx, eindy)),
		struct(photo(id, x, y, eindx, eindy, captionx, caption)),
			%
		struct(page(id, pageposition, width, height, anchors, articles)),
		struct(allocation(pageid, artid, layoutid, sx, sy, ex, ey, score)),
		struct(heuristic(adjacent, equaladjacent)),
		struct(anchor(x, y)).

try(FilledPages) :-
	loadPages(RawPages),
	loadArticles(RawArticles),
		%
	PageCount is length(RawPages),
	getGridSize(RawPages, ColWidth, RowHeight),
		%
	convertArticles(RawArticles, ColWidth, RowHeight, ConvertedArticles),
	convertPages(RawPages, ConvertedArticles, ColWidth, RowHeight, 1, PageCount, ConvertedPages, RemainingArticles),
		%
	doArticles(RemainingArticles, ConvertedPages, FilledPages, Score),
	!, 
	nl,
	print_list(FilledPages),
	nl, trace(printMatlab(ConvertedArticles, FilledPages)), nl, writeln(Score).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			INPUT CONVERSION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% getGridSize: Get the Column width and Row height (basislijnhoogte). Condition: needs to be the same for all pages.
getGridSize([], _, _).
getGridSize([ThisRawPage | OtherRawPages], ColWidth, RowHeight) :-
	ThisRawPage = pagein{usewidth:Width, basislijnhoogte:RowHeight},
	ColWidth is Width / 6,
	getGridSize(OtherRawPages, ColWidth, RowHeight).

%convertArticles: raw articles to structs
convertArticles([], _, _, []).
convertArticles([ThisRawArticle | OtherRawArticles], ColWidth, RowHeight, ArticlesOut) :-
	convertArticles(OtherRawArticles, ColWidth, RowHeight, ArticlesTemp),
		%
	ThisRawArticle = article{layouts:RawLayouts},
	convertLayouts(RawLayouts, ColWidth, RowHeight, ConvertedLayouts),
	update_struct(article, [layouts:ConvertedLayouts], ThisRawArticle, ThisConvertedArticle),
		%
	ArticlesOut = [ThisConvertedArticle | ArticlesTemp].

%convertLayouts: raw layouts to structs
convertLayouts([], _, _, []).
convertLayouts([ThisRawLayout | OtherRawLayouts], ColWidth, RowHeight, LayoutsOut) :-
	convertLayouts(OtherRawLayouts, ColWidth, RowHeight, LayoutsTemp),
		%
	ThisRawLayout = layout{width:Width0, height:Height0},
		% Width, Height
	Width  is integer(round(Width0 / ColWidth)),
	Height is integer(round(Height0 / RowHeight)),
	update_struct(layout, [width:Width, height:Height], ThisRawLayout, ThisConvertedLayout),
		%
	LayoutsOut = [ThisConvertedLayout | LayoutsTemp].

%convertPages: convert raw pages to structs
convertPages([], A, _, _, _, _, [], A).
convertPages([ThisRawPage | OtherRawPages], Articles, ColWidth, RowHeight, ThisPageNr, PageCount, ConvertedPages, RemainingArticles) :-
	ThisRawPage = pagein{id:Id, kopstukid:KopstukId, isleft:_, artikelslinks:_, margex:MargeX, margey:MargeY, usewidth:_, useheight:Height0, basislijnhoogte:_, ads:Ads},
		% PagePosition: Where is the page placed relative to other pages (ex. 4 pages: Begin = [0, 1/3, 2/3, 1] = Last)
	(PageCount = 1 -> PagePosition is 0 ; PagePosition is (ThisPageNr - 1) / (PageCount - 1)),
		% Width, Height
	Width is 6,
	Height is integer(ceiling(Height0 / RowHeight)),
		% Anchors
	EmptyPageAnchors = [anchor{x:0, y:0}, anchor{x:0, y:Height}, anchor{x:Width, y:0}, anchor{x:Width, y:Height}],
		%
	PageEmpty = page{id:Id, pageposition:PagePosition, width:Width, height:Height, anchors:EmptyPageAnchors, articles:[]},
		% Do Ads
	putAds(Ads, MargeX, MargeY, ColWidth, RowHeight, PageEmpty, PageAds),
		% Kopstuk
	putKopstuk(PageAds, KopstukId, Articles,   PageAdsKopstuk, RemainingArticles0),
		%
	NextPageNr is ThisPageNr + 1,
	convertPages(OtherRawPages, RemainingArticles0, ColWidth, RowHeight, NextPageNr, PageCount, PagesTemp, RemainingArticles),
	ConvertedPages = [PageAdsKopstuk | PagesTemp].

putAds([], _, _, _, _, A, A).
putAds([ThisAd | OtherAds], MargeX, MargeY, ColWidth, RowHeight, PageIn, PageOut) :-
	ThisAd = ad{id:AdId, x:X, y:Y, width:Width, height:Height},
		%
	SX is integer(round((X - MargeX) / ColWidth)),
	SY is integer(round((Y - MargeY) / RowHeight)),
	EX is SX + integer(round(Width / ColWidth)),
	EY is SY + integer(round(Height / RowHeight)),
		%
	Allocation = allocation{artid:0, layoutid:ArtId, sx:SX, sy:SY, ex:EX, ey:EY},
	ExtraAnchors = [anchor{x:SX, y:SY}, anchor{x:SX, y:EY}, anchor{x:EX, y:SY}, anchor{x:EX, y:EY}],
		% Merge to form NewAnchors (no duplicates: < instead of =<)
	PageIn = page{anchors:OldAnchors, articles:OldAllocations},
	merge(0, <, OldAnchors, ExtraAnchors, NewAnchors),
		% Add Ad to Page
	NewAllocations = [Allocation | OldAllocations],
		% Create new Page
	update_struct(page, [anchors:NewAnchors, articles:NewAllocations], PageIn, PageOutTemp),
		%
	putAds(OtherAds, MargeX, MargeY, ColWidth, RowHeight, PageOutTemp, PageOut).

%%put ThisAd on the PageIn, resulting in PageOut
%putAds([], A, A).	
%putAds([ThisAd | OtherAds], PageIn, PageOut) :-
%	ThisAd = ad{id:AdId, x:X0, y:Y0, width:Width0, height:Height0},
%	round(X0, X1), integer(X1, SX), round(Y0, Y1), integer(Y1, SY), round(Width0, Width1), integer(Width1, Width), round(Height0, Height1), integer(Height1, Height),
%		% Allocate Adspace
%	PageIn = page{id:PageId, articles:OldAllocations},
%	EX is SX + Width, EY is SY + Height,
%	Allocation = allocation{pageid:PageId, artid:AdId, layoutid:0, sx:SX, sy:SY, ex:EX, ey:EY, score:0},
%	update_struct(page, [articles:[Allocation | OldAllocations]], PageIn, PageTemp),
%		%
%	putAds(OtherAds, PageTemp, PageOut).

% putKopstuk. Put specified article first on the page
putKopstuk(A, 0, B, A, B).
putKopstuk(EmptyPage, KopstukId, Articles,    FilledPage, RemainingArticles) :-
		% Find right article
	member(KopArticle, Articles), KopArticle = article{id:KopstukId},
		% Place article on page
	doArticles([KopArticle], [EmptyPage], [FilledPage], _),
		% Remove article from stack
	delete(KopArticle, Articles, RemainingArticles).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			ARTICLE PLACEMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% doArticles: Complete Search. Output all possible results. Backtrackable (fist possible > last possible)
doArticles([], X, X, 0).
doArticles(Articles, EmptyPages, FilledPages, Score) :-
	Articles = [ThisArticle | _],
	(
		% Place ThisArticle
		custWrite(article, 'Trying Article: '), custWriteln(article, ThisArticle),
		doArticleOnPage(ThisArticle, EmptyPages,   Anchor, AllocationOnAnchor),
		AllocationOnAnchor = allocation{score:Heuristic}, heuristicToScore(Heuristic, ThisScore),

		BestAllocation = [Anchor, AllocationOnAnchor],
		delete(ThisArticle, Articles, OtherArticles),
			%
		doAllocation(BestAllocation, EmptyPages, PagesWithThisArticle),
		writeln('****** Allocation of Article ******'),
		write('Article    : '), writeln(ThisArticle),
		write('Allocation : '), writeln(BestAllocation),
		write('Score      : '), writeln(Score),
		write('Result     : '), writeln(PagesWithThisArticle),
		write('Remaining  : '), writeln(OtherArticles)
	; 
		writeln('***** Failed to place article *****'), 
		writeln(ThisArticle),
		delete(ThisArticle, Articles, OtherArticles),
		ThisScore is 0,
		PagesWithThisArticle = EmptyPages
	),
		% Tail recursion call. Place next article
	doArticles(OtherArticles, PagesWithThisArticle, FilledPages, ScoreTail),
	Score is ScoreTail + ThisScore.
	
heuristicToScore(Heuristic, Score) :-
	(
		foreach(ThisHeuristic, Heuristic),
		foreach(ThisScore, Scores)
	do
		ThisHeuristic = heuristic{adjacent:Adjacent, equaladjacent:EqualAdjacent},
			%
		(ground(Adjacent) -> 		AdjacentScore is 		Adjacent ^ 1.2		; 		AdjacentScore is 0),
		(ground(EqualAdjacent) -> 	EqualAdjacentScore is 	EqualAdjacent ^ 1.2 * 3	;	EqualAdjacentScore is 0),
			%
		ThisScore is AdjacentScore + EqualAdjacentScore
	), Score is sum(Scores).

% doAllocation: actually allocate this Allocation on this Anchor on ThisPage
doAllocation([Anchor, Allocation], [ThisPage | NextPages], PagesOut) :-
	(
			% Find right Page
		Allocation = allocation{pageid:Id},
		ThisPage = page{id:Id}, !,
			% 
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
		allocationScore([PW, PH], ArticleAllocations, AllocationOnAnchor, Heuristic0), flatten(Heuristic0, Heuristic),
		AllocationOnAnchor = allocation{score:Heuristic},
		custWrite(score, '    Score         : '), custWriteln(score, Heuristic),
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

% allocationScore with other articles
allocationScore([PW, PH], [ExistingAllocation | OtherAllocations], NewAllocation, Heuristic) :-
	allocationScore([PW, PH], OtherAllocations, NewAllocation, Heuristic0),
		%
	allocationScore(ExistingAllocation, NewAllocation, Heuristic1),
	append(Heuristic0, Heuristic1, Heuristic).
	%Score is Score0 + Score1.

% allocationScore with paper border
allocationScore([PW, PH], [], NewAllocation, Heuristic) :-
	Paper = allocation{sx:0, sy:0, ex:PW, ey:PH},
	allocationScore(Paper, NewAllocation, Heuristic).

% allocationScore of two allocations
allocationScore(ExistingAllocation, NewAllocation, Heuristics) :-
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
		foreach(ThisHeuristic, Heuristics)
	do
		intersectionLength(L1, L2, ThisHeuristic)
	). %,
	%Score is sum(LengthList).

% getLines: get the line segments of a rectangle (4 per rectangle)
getLines([SX, SY], [EX, EY], [[[SX, SY],[EX,SY]], [[SX,SY],[SX,EY]], [[SX,EY],[EX,EY]], [[EX,SY],[EX,EY]]]).

% Horizontal: SY0 = EY0 = SY1 = EY1
intersectionLength([[SX0, Y],[EX0, Y]], [[SX1, Y],[EX1, Y]], Heuristic) :- !,
	intersectionLength(SX0, EX0, SX1, EX1, Heuristic).
% Vertical: SX0 = SY0 = EX0 = EY0
intersectionLength([[X, SY0],[X, EY0]], [[X, SY1],[X, EY1]], Heuristic) :- !,
	intersectionLength(SY0, EY0, SY1, EY1, Heuristic).
% Orthogonal (last [] adds nothing to list of heuristic scores)
intersectionLength([[_, _],[_, _]], [[_, _],[_, _]], []) :- !.

% Special case: two exact same sizes together get a higher score
intersectionLength(S, E, S, E, Heuristic) :- !,
	Val is (E - S),
	Heuristic = heuristic{equaladjacent:Val}.
% Other cases
intersectionLength(_, EX0, SX1, _, Heuristic) :-
	EX0 =< SX1, !,
	Heuristic = heuristic{adjacent:0}.
intersectionLength(SX0, EX0, SX1, EX1, Heuristic) :-
	SX0 =< SX1, EX0 >= SX1, EX0 =< EX1, !,
	Val is (EX0 - SX1),
	Heuristic = heuristic{adjacent:Val}.
intersectionLength(SX0, EX0, SX1, EX1, Heuristic) :-
	SX1 < SX0, EX0 < EX1, !,
	Val is (EX0 - SX0),
	Heuristic = heuristic{adjacent:Val}.
intersectionLength(SX0, EX0, SX1, EX1, Heuristic) :- !,
	intersectionLength(SX1, EX1, SX0, EX0, Heuristic).

% Special case: two exact same sizes together get a higher score
%intersectionLength(S, E, S, E, Length) :- !,
%	Length is (E - S) ^ 2.
%	Length is (E - S) ^ 1.2 * 3.
%intersectionLength(_, EX0, SX1, _, Length) :-
%	EX0 =< SX1, !,
%	Length = 0.
%intersectionLength(SX0, EX0, SX1, EX1, Length) :-
%	SX0 =< SX1, EX0 >= SX1, EX0 =< EX1, !,
%	Length is (EX0 - SX1) ^ 1.2.
%intersectionLength(SX0, EX0, SX1, EX1, Length) :-
%	SX1 < SX0, EX0 < EX1, !,
%	Length is (EX0 - SX0) ^ 1.2.
%intersectionLength(SX0, EX0, SX1, EX1, Length) :- !,
%	intersectionLength(SX1, EX1, SX0, EX0, Length).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			CUSTOM WRITELN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%custWrite(article,	A)	:- write(A).
%custWrite(page, 	A)	:- write(A). 
%custWrite(layout,	A)	:- write(A).
%custWrite(anchor, 	A)	:- write(A).
%custWrite(direction,A) 	:- write(A).
%custWrite(score,    A)  :- write(A).
custWrite(article,	A)	:- true. %write(A).
custWrite(page, 	A)	:- true. %write(A). 
custWrite(layout,	A)	:- true. %write(A).
custWrite(anchor, 	A)	:- true. %write(A).
custWrite(direction,A) 	:- true. %write(A).
custWrite(score,   A)  :- true.
custWriteln(T, A)	 	:- custWrite(T, A), custWrite(T, '\n').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			RUBBISH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

printMatlab(AllArts, [ThisPage | OtherPages]) :-
	ThisPage = page{articles:Articles},
	write('P'), 
	B is 7 - length([ThisPage | OtherPages]), 
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
getTypeCode(_, 2).