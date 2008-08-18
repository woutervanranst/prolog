:- include(artikels_hln2).

try(Alloc, Time) :-
		%Statistics Setup
	statistics(times, [Time0,_,_]),
		%Set GridSize
	WidthGrid = 80, %10,
	HeightGrid = 120, %15,
	write('Page Size (WxH): '), writeln([WidthGrid, HeightGrid]),
		%Load and convert input
	loadArtikels(PageWidth, PageHeight, RawArts),
	convertArticles(PageWidth, PageHeight, WidthGrid, HeightGrid, RawArts, ConvArts),
		%Do actual allocation
	PreAlloc = [], % HIER AD-SPACE invoeren
	doArticle([WidthGrid, HeightGrid], PreAlloc, PostAlloc, ConvArts),
	printPage([WidthGrid, HeightGrid], PostAlloc),
	reverse(PostAlloc, Alloc),
		%Statistics teardown
	statistics(times, [Time1,_,_]),
	Time is Time1 - Time0.
	%write('Time: '), writeln(round(Time * 100)).

%doArticle: Allocate a new article on the page
%[PW, PH]: PageSize, OldArtAlloc: Previously allocated articls, NewArtAlloc (out): newly allocated articles, ThisArt: current article, OtherArts: other articles
doArticle([PW, PH], OldArtAlloc, NewArtAlloc, [ThisArt | OtherArts]) :-
	write('Placing: '), writeln(ThisArt),
	getLayouts(ThisArt, Layouts),
	doLayout([PW, PH], OldArtAlloc, InterArtAlloc, ThisArt, Layouts),
		%Tail recursion call
	doArticle([PW, PH], InterArtAlloc, NewArtAlloc, OtherArts).
doArticle(_, A, A, []).

%doLayout: [PW, PH]: PageSize, OldArtAlloc: Previously allocated articls, NewArtAlloc (out): newly allocated articles, Article: Article, [Layout|OtherLayouts]: all possible layouts 
doLayout([PW, PH], OldArtAlloc, NewArtAlloc, Article, [Layout | OtherLayouts]) :-
	(
			%Allocate Free Space
		getLayoutSize(Layout, LW, LH),
		getFreeSpace([PW, PH], OldArtAlloc, [LW, LH], [1, 1], [SX, SY]),
		EX is SX + LW - 1, EY is SY + LH - 1,
			%Check validity of Space
		getArticleType(Article, Type),
		isValidLocation([PW, PH], [SX, SY], [EX, EY], Type),
			%Actual allocation on page
		getLayoutId(Layout, LayoutId),
		NewArtAlloc = [ [LayoutId, [SX, SY], [EX, EY]] | OldArtAlloc],
		write('Placed: '), write(LayoutId), write(' '), writeln([SX, EX, SY, EY])
	;
			%If allocation of free space, validity of space fails, try another layout
		doLayout([PW, PH], OldArtAlloc, NewArtAlloc, Article, OtherLayouts)
	).
doLayout(_, A, A, _, []) :- writeln('Not placed').
		
%getFreeSpace: [PX, PY] PageSize, [NeedX, NeedY] ArticleSize, [SX, SY] InitialStartCoord, [SX1, SY1]
getFreeSpace([PX, PY], OldArtAlloc, [NeedX, NeedY], [SX, SY], [SX1, SY1]) :-
	(
		EX is SX + NeedX - 1,
		EY is SY + NeedY - 1,
		EX =< PX,
		EY =< PY,
		checkOverlap(OldArtAlloc, [SX, SY], [EX, EY]),
		SX1 is SX, SY1 is SY
	;
		nextStart(PX, PY, SX, SY, SX0, SY0),
		getFreeSpace([PX, PY], OldArtAlloc, [NeedX, NeedY], [SX0, SY0], [SX1, SY1])
	).

%nextStart: PW, PH: PageSize, SX1, SY1: Current bad start coord, SX2, SY2 new start coord to try with
nextStart(PW, PH, PW, PH, _, _) 		:- !, fail.
nextStart(PW, _, PW, SY1, 1, SY2) 		:- !, SY2 is SY1 + 1.
nextStart(_, _, SX1, SY1, SX2, SY1) 	:- SX2 is SX1 + 1.	

%checkOverlap: [NASX, NASY] NewArtStartCoord, [NAEX, NAEY]: NewArtEndCoord, [OASX, OASY] OldArtStartCoord, [OAEX, OAEY]: OldArtEndCoord
%Check if the new article would overlap with an existing article
checkOverlap([], _, _).
checkOverlap([Arts | OtherArts], [NASX, NASY], [NAEX, NAEY]) :-
	Arts = [_, [OASX, OASY], [OAEX, OAEY]],
	checkOverlap([NASX, NASY], [NAEX, NAEY], [OASX, OASY], [OAEX, OAEY]),
	checkOverlap(OtherArts, [NASX, NASY], [NAEX, NAEY]).

%checkOverlap w/ 4 overloads: Check if two given rectangles ([NASX, NASY], [NAEX, NAEY] ; [OASX, OASY], [OAEX, OAEY]) overlap
checkOverlap(_, [NAEX, _], [OASX, _], _) :- NAEX < OASX, !.
checkOverlap(_, [_, NAEY], [_, OASY], _) :- NAEY < OASY, !.
checkOverlap([NASX, _], _, _, [OAEX, _]) :- NASX > OAEX, !.
checkOverlap([_, NASY], _, _, [_, OAEY]) :- NASY > OAEY, !.

%isValidLocation: 'Kopstuk' should be placed on the first line. Others can be placed everywhere (see overload)
% Syntax: [PW, PH], [SX, SY], [EX, EY]
isValidLocation(_, [_, SY], _, kopstuk) :- !, SY == 1.
isValidLocation(_, _, _, _).

getArticleType(Article, Type) :-
	Article = artikel(_, type(Type), _, _).
	
getLayouts(Article, Layouts) :-
	Article = artikel(_, _, _, Layouts).

getLayoutSize(Layout, Width, Height) :-
	Layout = layout(_, width(Width), height(Height)).

getLayoutId(Layout, Id) :-
	Layout = layout(id(Id), _, _).
	
%convertArticles
convertArticles(PW, PH, GW, GH, Art, ArtOut) :-
	GWUnit is PW / GW,
	GHUnit is PH / GH,
	(
		foreachelem(ThisArticle, Art),
		param(GWUnit, GHUnit)
	do
		getLayouts(ThisArticle, Layout),
		(
			foreachelem(ThisLayout, Layout),
			param(GWUnit, GHUnit)
		do
			getLayoutSize(ThisLayout, W0, H0),
			W1 is integer(ceiling(W0 / GWUnit)),
			H1 is integer(ceiling(H0 / GHUnit)),
			setarg(2, ThisLayout, width(W1)),
			setarg(3, ThisLayout, height(H1))
		),
		flatten_array(Layout, DD),
		setarg(4, ThisArticle, DD)
	),
	flatten_array(Art, ArtOut).

%printPage: [PW, PH] PageSize, Alloc Allocated Articles. Print the allocated articles visually.
printPage([PW, PH], Alloc) :-
	dim(Page, [PW, PH]),
	(
		foreach([Id, [SX, SY], [EX, EY]], Alloc),
		param(Page)
	do
		(
			multifor([X, Y], [SX, SY], [EX, EY]),
			param(Page, Id)
		do
			subscript(Page, [X, Y], Id)
		)
	),
	(
		multifor([Y,X], [1,1], [PH, PW]),
		param(Page)
	do
		( X == 1 -> nl ; true ), write(' '),
		(
			A is subscript(Page, [X,Y]), ground(A), !, write(A)
		;
			write('.....')
		)
	), nl.