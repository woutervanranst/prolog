%use_module(library(sgml)).
%
%try :-
%	load_xml_file('/Users/wouter/Desktop/Cronos/data2.xml', File),
%	File.
%
%element(A,B,C).
%	

:- include(artikels).

try(Arts, Page) :-
	WidthGrid = 50,
	HeightGrid = 100,
	write('Page Size (WxH): '), writeln([WidthGrid, HeightGrid]),
	loadArtikels(PageWidth, PageHeight, Articles),
	convertArticles(PageWidth, PageHeight, WidthGrid, HeightGrid, Articles, Arts),
	dim(Page, [WidthGrid, HeightGrid]), !, 
	doArticle(Arts, Page),
	true. %printPage(Page).

printPage(Page) :-
	dim(Page, [PW, PH]),
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

%l2a(List, Array) :-
%	(
%		foreacharg(El, List),
%		fromto([], In, [X|In], Array2)
%	do
%		(
%			dim(El, [Dim]),		% Fails if El is not a List [](...)
%			l2a(El, X)			% Recursive call
%		;
%			X = El
%		)
%	),
%	reverse(Array2, Array).		% Reverse the array and return it

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
	
doArticle([ThisArt|OtherArts], Page) :-
	write('Placing: '), writeln(ThisArt),
	getLayouts(ThisArt, Layouts),
	doLayout(Layouts, Page),
	doArticle(OtherArts, Page).
doArticle([], _).

doLayout([Layout|OtherLayouts], Page) :-
	(
		getLayoutSize(Layout, AW, AH),
		getFreeSpace(Page, AW, AH, 1, 1, SX, SY),
		getLayoutId(Layout, Id),
		setArticle(Page, SX, SY, AW, AH, Id),
		EX is SX + AW - 1,
		EY is SY + AH - 1,
		write('Placed: '), writeln([SX, EX, SY, EY])				
	;
		doLayout(OtherLayouts, Page)
	).
%doLayout([], _). % Moet in comment

%GETfreespace faalt na 56 keer: setArticle  wordt opgeroepen met 21 als indexargument == out of bounds
getFreeSpace(Page, AW, AH, SX, SY, X, Y) :-
	dim(Page, [PW, PH]),
	EX is SX + AW - 1,
	EY is SY + AH - 1,
	(
		EX =< PW,
		EY =< PH,
		checkFreeSpace(Page, SX, SY, EX, EY),
		X is SX,
		Y is SY	
	;
		nextStart(PW, PH, SX, SY, SX1, SY1),
		getFreeSpace(Page, AW, AH, SX1, SY1, X, Y)
	).
	
nextStart(PW, PH, PW, PH, _, _) 		:- !, fail.
nextStart(PW, _, PW, SY1, 1, SY2) 		:- !, SY2 is SY1 + 1.
nextStart(_, _, SX1, SY1, SX2, SY1) 	:- SX2 is SX1 + 1.

checkFreeSpace(Page, X1, Y1, X2, Y2) :-
	(
		multifor([X, Y], [X1, Y1], [X2, Y2]),
		param(Page)
	do
		nonground(Page[X,Y])
	).

setArticle(Page, SX, SY, AW, AH, Id) :-
	EX is SX + AW - 1,
	EY is SY + AH - 1,
	dim(Page, [PW, PH]),
	EX =< PW,
	EY =< PH,	%DIRTY FIX!!!
	(
		multifor([X, Y], [SX, SY], [EX, EY]),
		param(Page, Id)
	do
		subscript(Page, [X, Y], Id)	
	).
	


getLayouts(Article, Layouts) :-
	Article = artikel(_, _, _, Layouts).

getLayoutSize(Layout, Width, Height) :-
	Layout = layout(_, width(Width), height(Height)).

getLayoutId(Layout, Id) :-
	Layout = layout(id(Id), _, _).