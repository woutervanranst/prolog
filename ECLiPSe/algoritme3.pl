:- include(artikels_hln10).

:- lib(branch_and_bound).
:- lib(ic).
%:- lib(suspend).

% Structures preamble
:- local
		struct(pagein(id, isleft, artikelslinks, margex, margey, usewidth, useheight, ads)),
			%
		struct(page(id, pageposition, width, height, content, articles, allocation)),
		struct(ad(id, x, y, width, height)),
		struct(article(id, type, plaatsing, layouts)),
		struct(layout(id, width, height)).
		%struct(allocation(pageid, artid, layoutid, sx, sy, ex, ey, score)),
		%struct(heuristic(adjacent, equaladjacent)).
	
:- local
		struct(rectangle(x, y, width, height, content)).
	
try(Out) :-
	loadPages(RawPages),
	loadArticles(RawArticles),
		%
	PageCount is length(RawPages),
	convertPages(RawPages, 1, PageCount,   ColWidth, ConvertedPages),
	convertArticles(RawArticles, ColWidth,   ConvertedArticles),
		%
	fillPages(ConvertedPages, ConvertedArticles, Out), !,
	trace(printMatlab(ConvertedArticles, Out)).
	
% fillPages
fillPages([EmptyPage | OtherPages], Articles, FilledPages) :-
		% Get page rectangle
	EmptyPage = page{content:EmptyPageRectangle},
		% Fill page rectangle
	fillRectangles(EmptyPageRectangle, Articles, RemainingArticles, FilledPageRectangle),
		% Convert relative rectangle to absolute allocation
	%rectangleToAllocation(FilledPageRectangle, PageAllocations),
		% Update page
	update_struct(page, [content:FilledPageRectangle], EmptyPage, FilledPage),
		% Tail recursive call
	fillPages(OtherPages, RemainingArtices, OtherFilledPages),
	FilledPages = [FilledPage | OtherFilledPages].
fillPages([], _, []).

rectangleToAllocation(X, X).

% fillRectangle. Try with an article.
fillRectangles([EmptyRectangle | OtherRectangles], Articles,   RemainingArticles, FilledRectangles) :-
		% Get rectangle size
	EmptyRectangle = rectangle{x:RX, y:RY, width:RW, height:RH},
	indomain(RW),
	%get_max(RH0, RH),
		% Find articles with size RW
	findArticlesWithWidth(Articles, RW, ArticlesWithWidth),
		% Pick best article TODO HEURISTIEK
	member(ThisArticle, ArticlesWithWidth),
	ThisArticle = article{id:ArtId, layouts:Layouts},
	member(ThisLayout, Layouts),
	ThisLayout = layout{id:LayoutId, height:LH},
		% Check conditions
	is_in_domain(LH, RH),
		% Allocate
	EmptyRectangle = rectangle{height:LH},
	%SX is RX, SY is RY,
	%EX is RX + LW, EY is RY + LH,
	%update_struct(rectangle, [content:allocation{artid:ArtId, layoutid:LayoutId, sx:SX, sy:SY, ex:EX, ey:EY}], EmptyRectangle, FilledRectangle),
	update_struct(rectangle, [content:[ArtId, LayoutId]], EmptyRectangle, FilledRectangle),
		% Delete placed article from list
	deleteArticle(ThisArticle, Articles, RemainingArticles0),
		% Tail recursive call
	fillRectangles(OtherRectangles, RemainingArticles0, RemainingArticles, OtherFilledRectangles),
	FilledRectangles = [FilledRectangle | OtherFilledRectangles].
fillRectangles([], A, A, []).

% fillRectangle. Try with a placeholder.
fillRectangles([EmptyRectangle | OtherRectangles], Articles,   RemainingArticles, FilledRectangles) :-
	EmptyRectangle = rectangle{x:X, y:Y, width:PW, height:PH},
	PersistenceIn = [X, Y, PW, PH],
	getPlaceholder(PlaceholderName, 1, PersistenceIn, PersistenceOut, EmptyRectangles),
	fillPlaceholderRectangles(EmptyRectangles, Articles, RemainingArticles, PlaceholderName, 1, PersistenceOut, _, FilledRectangles),
		% Update rectangle
	EmptyRectangle = rectangle{content:FilledRectangles},
	FilledRectangle = EmptyRectangle.
	


fillPlaceholderRectangles(EmptyRectangles, Articles, RemainingArticles, PlaceholderName, Step, PersistenceIn, PersistenceOut, FilledRectangles) :-
	fillRectangles(EmptyRectangles, Articles, RemainingArticles0, FilledRectangles0),
		%
	NextStep is Step + 1,
	getPlaceholder(PlaceholderName, NextStep, PersistenceIn, PersistenceOut0, EmptyRectangles0),
	(
			% Placeholder is complete
		EmptyRectangles0 = [], !,
		FilledRectangles = FilledRectangles0,
		RemainingArticles = Articles
	;
			% Placeholder is incomplete
		fillPlaceholderRectangles(EmptyRectangles0, RemainingArticles0, RemainingArticles, PlaceholderName, NextStep, PersistenceOut0, PersistenceOut, FilledRectangles1),
		append(FilledRectangles0, FilledRectangles1, FilledRectangles)
	).

deleteArticle(article{id:Id}, ArticlesIn, ArticlesOut) :-
	member(ThisArticle, ArticlesIn), 
	ThisArticle = article{id:Id}, 
	delete(ThisArticle, ArticlesIn, ArticlesOut).
	
% findArticlesWithWidth.
% DET. Fails when no articles found.
findArticlesWithWidth(ArticlesIn, Width, ArticlesOut) :-
	findall(
		ThisArticle0,
		(
			member(ThisArticle, ArticlesIn),
			ThisArticle = article{layouts:Layouts},
			findall(
				ThisLayout,
				(
					member(ThisLayout, Layouts),
					ThisLayout = layout{width:Width}
				),
				GoodLayouts),
			not(GoodLayouts = []),
			update_struct(article, [layouts:GoodLayouts], ThisArticle, ThisArticle0)
		),
		ArticlesOut),
	not(ArticlesOut = []).

% placeholder for initialschrankedpage, step 1, start: (X, Y), size:(PW, PH)
getPlaceholder(initialschrankedpage, 1, PersistenceIn, PersistenceOut, EmptyRectangles) :-
		% Persistence
	PersistenceIn = [X, Y, PW, PH],
		% Placeholder conditions
	get_max(PH, PHMax),	%when putting a placeholder in a placeholder that is not yet initialized	
	PW = 6, PHMax > 1100,
		% C1 conditions
	C1W #:: 5..6, 		% C1 should span 5-6 columns
	C1H #::0..PHMax,	% C1 should be smaller than the container
	C1X = 0,
	C1Y = 0,
	C1 = rectangle{width:C1W, height:C1H, x:C1X, y:C1Y},
		% C2 conditions
	C2W #:: 2..6, 		% C2 should span 2-6 columns
	C2H #< PH - C1H,	% C2 should be smaller than the remaining height in the container
	C2X + C2W #= PW,	% C2 should be right-aligned to the container
	C2Y = C1H,
	C2 = rectangle{width:C2W, height:C2H, x:C2X, y:C2Y},	% C2 is adjacent to the bottom of C1 (y:C1H)
		% F1
	F1W #= 6 - C1W,
	F1H = C1H,
	F1X = C1W,
	F1Y = 0,
	F1 = rectangle{width:F1W, height:F1H, x:F1X, y:F1Y},
		%
	EmptyRectangles = [C1, C2, F1],
		% Persistence
	PersistenceOut = [X, Y, PW, PH, C1W, C1H, C1X, C1Y, C2W, C2H, C2X, C2Y, F1W, F1H, F1X, F1Y].

getPlaceholder(initialschrankedpage, 2, PersistenceIn, PersistenceOut, EmptyRectangles) :-
		% Persistence
	PersistenceIn = [X, Y, PW, PH, C1W, C1H, C1X, C1Y, C2W, C2H, C2X, C2Y, F1W, F1H, F1X, F1Y],
		% Placeholder conditions
	C2W = 2,
		% C3 conditions
	C3W #:: 2..4,
	C3X = 0,
	C3Y #=< C2Y + C2H,
	C3Y + C3H #= PH,	% C3 should be on the bottom of the container
	C3 = rectangle{width:C3W, height:C3H, x:C3X, y:C3Y},	% C3 is left-aligned (x:0)
		%
	EmptyRectangles = [C3],
		% Persistence
	PersistenceOut = [X, Y, PW, PH, C1W, C1H, C1X, C1Y, C2W, C2H, C2X, C2Y, C3W, C3H, C3X, C3Y, F1W, F1H, F1X, F1Y].
	

getPlaceholder(initialschrankedpage, 3, PersistenceIn, PersistenceOut, EmptyRectangles) :-
		% Persistence
	PersistenceIn = [X, Y, PW, PH, C1W, C1H, C1X, C1Y, C2W, C2H, C2X, C2Y, C3W, C3H, C3X, C3Y, F1W, F1H, F1X, F1Y],
		% Placeholder conditions
	C3W =< C2X,
	C3Y =< C1H + C2H,
		% C4 conditions
	C4H - (C3Y - C1H) #< 50,
	C4 = rectangle{x:0, y:C2Y, width:C2X, height:C4H},
		%
	EmptyRectangles = [C4].


getPlaceholder(initialschrankedpage, 4, _, _, []).

getPlaceholder(kortjeskolom, 1, PersistenceIn, _, EmptyRectangles) :-
		% Persistence
	PersistenceIn = [X, Y, PW, PH],
		% Placeholder conditions
	PW = 1,
		% F1, F2
	F1 = rectangle{x:X, y:Y, width:1, height:F1H},
	F2 = rectangle{x:X, y:F1H, width:1, height:F2H},
	F1H + F2H #=< PH,
	PH - F1H - F2H #< 20,
		%
	EmptyRectangles = [F1, F2].
	
getPlaceholder(kortjeskolom, 2, _, _, []).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			INPUT CONVERSION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%convertPages: convert raw pages to structs
convertPages([], _, _, _, []).
convertPages([ThisRawPage | OtherRawPages], ThisPageNr, PageCount,    ColWidth, ConvertOut) :-
	NextPageNr is ThisPageNr + 1,
	convertPages(OtherRawPages, NextPageNr, PageCount, ColWidth, PagesTemp),
	ThisRawPage = pagein{id:Id, isleft:_, artikelslinks:_, margex:_, margey:_, usewidth:Width0, useheight:Height0, ads:Ads},
		%
	Width is 6, ColWidth is Width0 / Width, %6 kolommen
	Height is integer(round(Height0)),
		% Where is the page placed relative to other pages (ex. 4 pages: Begin = [0, 1/3, 2/3, 1] = Last)
	(PageCount = 1 -> PagePosition is 0 ; PagePosition is (ThisPageNr - 1) / (PageCount - 1)),
	EmptyPageRectangle = rectangle{width:Width, height:Height, x:0, y:0},
	ThisConvertedPage = page{id:Id, pageposition:PagePosition, width:Width, height:Height, content:[EmptyPageRectangle], articles:[]},
	%	% Do Ads
	%putAds(Ads, ThisConvertedPage, ThisConvertedPage0),
	ConvertOut = [ThisConvertedPage | PagesTemp].

%%put ThisAd on the PageIn, resulting in PageOut
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
%putAds([], A, A).

%convertArticles: raw articles to structs
convertArticles([], _, []).
convertArticles([ThisRawArticle | OtherRawArticles], ColWidth,   ArticlesOut) :-
	convertArticles(OtherRawArticles, ColWidth,   ArticlesTemp),
		%
	ThisRawArticle = article{layouts:RawLayouts},
	convertLayouts(RawLayouts, ColWidth,   ConvertedLayouts),
	update_struct(article, [layouts:ConvertedLayouts], ThisRawArticle, ThisConvertedArticle),
	ArticlesOut = [ThisConvertedArticle | ArticlesTemp].

%convertLayouts: raw layouts to structs
convertLayouts([], _,   []).
convertLayouts([ThisRawLayout | OtherRawLayouts], ColWidth,   LayoutsOut) :-
	convertLayouts(OtherRawLayouts, ColWidth,   LayoutsTemp),
		%
	ThisRawLayout = layout{width:Width0, height:Height0},
		%round(Width0, Width1), integer(Width1, Width), 
		%round(Height0, Height1), integer(Height1, Height),
		Width is integer(round(Width0 / ColWidth)),
		Height is integer(round(Height0)),
	update_struct(layout, [width:Width, height:Height], ThisRawLayout, ThisConvertedLayout),
	LayoutsOut = [ThisConvertedLayout | LayoutsTemp].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			CUSTOM WRITELN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%custWrite(article,	A)	:- write(A).
%custWrite(page, 	A)	:- write(A). 
%custWrite(layout,	A)	:- write(A).
%custWrite(anchor, 	A)	:- write(A).
%custWrite(direction,A) 	:- write(A).
%custWrite(score,    A)  :- write(A).
%custWrite(article,	A)	:- true. %write(A).
%custWrite(page, 	A)	:- true. %write(A). 
%custWrite(layout,	A)	:- true. %write(A).
%custWrite(anchor, 	A)	:- true. %write(A).
%custWrite(direction,A) 	:- true. %write(A).
%custWrite(score,   A)  :- true.
%custWriteln(T, A)	 	:- custWrite(T, A), custWrite(T, '\n').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			RUBBISH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

printMatlab(AllArts, [ThisPage | OtherPages]) :-
	ThisPage = page{content:Articles},
	write('P'), 
	B is 2 - length([ThisPage | OtherPages]), 
	write(B), 
	write(' = ['),
	%reverse(Articles, Articles0),
	printMatlabPage(AllArts, Articles),
	writeln('];'),
		%
	printMatlab(AllArts, OtherPages).
printMatlab(_, []).	

printMatlabPage(AllArts, [ThisArticle | OtherArticles]) :-
	ThisArticle = rectangle{x:X, y:Y, width:Width, height:Height, content:[_, LayoutId]},
	%( LId = 0 -> Type=0 ; getType(AllArts, Id, Type)),
	SX is 137 * X, SY is Y,
	EX is 137 * (X + Width), EY is Y + Height,
	write([LayoutId, SX, SY, EX, EY, 1]), 
	(length(OtherArticles, 0) -> true ; write('; ')),
	printMatlabPage(AllArts, OtherArticles).
printMatlabPage(_, []).

getType(AllArts, Id, Type) :-
	member(X, AllArts), X = article{id:Id, type:Type0}, getTypeCode(Type0, Type).

getTypeCode(ad, 0).
getTypeCode(kopstuk, 1).
getTypeCode(normaal, 2).
getTypeCode(kortje, 3).