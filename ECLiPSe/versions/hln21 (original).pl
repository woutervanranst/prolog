:- include(artikels_hln20).

% Structures preamble
:- local
		struct(pagein(id, kopstukid, isleft, artikelslinks, margex, margey, usewidth, useheight, basislijnhoogte, ads)),
		struct(ad(id, x, y, width, height)),
		struct(article(id, type, plaatsing, kader, layouts)),
		struct(layout(id, width, height, components, photos)),
		struct(component(type, font, fontsize, x, y, eindx, eindy)),
		struct(photo(id, x, y, eindx, eindy, captionx, captiony, captioneindx, captioneindy)),
			%
		struct(page(id, width, height, allocations, anchors)),
		struct(allocation(layoutid, sx, sy, ex, ey, article)),
		struct(anchor(x, y)).

try(FilledPages) :-
	loadPages(RawPages),
	loadArticles(RawArticles),
		% Convert Articles
	getGridSize(RawPages, ColWidth, RowHeight),
	convertArticles(RawArticles, ColWidth, RowHeight, ConvertedArticles),
		% Convert Pages, place ads and reserved kopstuk
	convertPages(RawPages, ConvertedArticles,   Pages0, Articles0),
		% Place other kopstukken
	putRemainingKopstukken(Pages0, Articles0,   Pages1, Articles1),
		% Place fotoartikels
	true,
		% Place other articles
	doArticles(Pages1, Articles1, _,  Pages2, Articles2),
		
%	Pages1 = [page{allocations:Allocations} | _ ],
%	trace(findLowerAllocation(anchor{x:0, y:65}, 5, Allocations, LowerAllocation)),

	FilledPages = Pages2,
	
	printMatlab(FilledPages).

%findLowerAllocation(anchor{x:NASX, y:NASY}, Width, Allocations,   LowerAllocation) :-
%	print_list(Allocations), nl, 
%	NAEX is NASX + Width,
%	%AnchorAllocation = allocation{sx:AnchorSX, sy:AnchorSY, ex:AnchorEX, ey:SY},
%	findall(
%		Allocation,
%		(
%			member(Allocation, Allocations),
%			Allocation = allocation{sx:OASX, sy:OASY, ex:OAEX},
%			(NAEX >= OASX ; NASX =< OAEX, !)
%
%		),
%		LowerAllocations),
%	print_list(LowerAllocations),
%	true.


%  *********** KOPSTUKKEN
% putKopstuk. Put specified article first on the page
putKopstuk(A, 0, B, A, B).
putKopstuk(EmptyPage, KopstukId, Articles,    FilledPage, RemainingArticles) :-
		% Find right article
	member(KopArticle, Articles), KopArticle = article{id:KopstukId},
		% Place article on page
	doArticles(normal, [EmptyPage], [KopArticle], _, [FilledPage], []),
		% Remove article from stack
	delete(KopArticle, Articles, RemainingArticles).
	
%  *********** REMAINING KOPSTUKKEN
putRemainingKopstukken(PagesIn, ArticlesIn,   PagesOut, ArticlesOut) :-
		% Filter kopstukken
	findall(
		Article,
		(
			member(Article, ArticlesIn),
			Article = article{type:kopstuk}
		),
		Kopstukken),
		% Place article on page
	doArticles(normal, PagesIn, Kopstukken, _, PagesOut, UnplacedKopstukken),
	subtract(Kopstukken, UnplacedKopstukken, PlacedKopstukken),
	subtract(ArticlesIn, PlacedKopstukken, ArticlesOut).

%  *********** FOTOARTIKELS
putPhotoArticles(EmptyPage, PhotoArticles,   FilledPage, RemainingPhotoArticles) :-
		% Create PhotoArticleAnchor
	EmptyPage = page{width:Width, allocations:Allocations},
	findall(Allocation, 
	(
		member(Allocation, Allocations),
		Allocation = allocation{article:Kopstuk},
		Kopstuk = article{type:kopstuk}
	), Kopstukken),
	length(Kopstukken, 1),
	Kopstukken = [allocation{ey:EY} | _ ],
	PhotoArticleAnchor = anchor{x:Width, y:EY},
		% Place article on anchor
	trace(doArticles(photo, [EmptyPage], PhotoArticles, PhotoArticleAnchor, [FilledPage], RemainingPhotoArticles)),
	
	true.
	
	
	

doArticles(photo, A, [], _, A, []).
doArticles(photo, PagesIn, ArticlesIn, FixAnchor,   PagesOut, ArticlesOut) :-
		% Choose Article, then page (Business Rule: Volgorde van artikels moet gevolgd worden) 
	member(Article, ArticlesIn),
	%write('Article: '), writeln(Article),
	member(Page, PagesIn),
	%write(' Page:    '), writeln(Page),
		% Choose Layout (Business Rule: Volgorde Artikel_Layouts moet gevolgd worden)
	Article = article{layouts:Layouts},
	member(Layout, Layouts),
	%write('  Layout:  '), writeln(Layout),
		% Choose Anchor
	(
		var(FixAnchor) ->
		Page = page{anchors:Anchors},
		member(Anchor, Anchors)
	;
		Anchor = FixAnchor
	),
	%write('    Anchor:  '), writeln(Anchor),
		% Choose Direction
	Directions = [dr, dl, ur, ul],
	member(Direction, Directions),
	%write('     Dir:     '), writeln(Direction),
		% Get (partial) Allocation
	getAllocationRectangle(Direction, Page, Anchor, Layout,    Allocation),
		% Check validity of Allocation
	isValidAllocation(Allocation, Article),
		% Check overlap w/ existing allocations
	Page = page{allocations:Allocations},
	noOverlap(Allocation, Allocations),
		%
		% Do Allocation
	Allocation = allocation{article:Article},
	doAllocation(Allocation, Page, Page0),
		% Out Params
	replace(PagesIn, Page, Page0, Pages1),
		%
	delete(Article, ArticlesIn, ArticlesOut).
	
doArticles(normal, A, [], _, A, []).
doArticles(normal, PagesIn, ArticlesIn, FixAnchor,   PagesOut, ArticlesOut) :-
		% Choose Article, then page (Business Rule: Volgorde van artikels moet gevolgd worden) 
	member(Article, ArticlesIn),
	%write('Article: '), writeln(Article),
	(
		member(Page, PagesIn),
		%write(' Page:    '), writeln(Page),
			% Choose Layout (Business Rule: Volgorde Artikel_Layouts moet gevolgd worden)
		Article = article{layouts:Layouts},
		member(Layout, Layouts),
		%write('  Layout:  '), writeln(Layout),
			% Choose Anchor
		(
			var(FixAnchor) ->
			Page = page{anchors:Anchors},
			member(Anchor, Anchors)
		;
			Anchor = FixAnchor
		),
		%write('    Anchor:  '), writeln(Anchor),
			% Choose Direction
		Directions = [dr, dl, ur, ul],
		member(Direction, Directions),
		%write('     Dir:     '), writeln(Direction),
			% Get (partial) Allocation
		getAllocationRectangle(Direction, Page, Anchor, Layout,    Allocation),
			% Check validity of Allocation
		isValidAllocation(Allocation, Article),
			% Check overlap w/ existing allocations
		Page = page{allocations:Allocations},
		noOverlap(Allocation, Allocations),
			%
			% Do Allocation
		Allocation = allocation{article:Article},
		doAllocation(Allocation, Page, Page0),
			% Out Params
		replace(PagesIn, Page, Page0, Pages1),
			% Recursive call
		delete(Article, ArticlesIn, Articles1),
		doArticles(normal, Pages1, Articles1, FixAnchor, PagesOut, ArticlesOut)
	;
		write('*** Unable to place article: '), writeln(Article),
		Pages1 = PagesIn,
			% Recursive call
		delete(Article, ArticlesIn, Articles1),
		doArticles(normal, Pages1, Articles1, FixAnchor, PagesOut, ArticlesOut0),
		ArticlesOut = [Article | ArticlesOut0]
	).
	
	
	
	

%doArticles(A, [], _, A, []).
%doArticles(PagesIn, ArticlesIn, FixAnchor,  PagesOut, ArticlesOut) :-
%	(
%			% Choose Article, then page (Business Rule: Volgorde van artikels moet gevolgd worden) 
%		member(Article, ArticlesIn),
%		member(Page, PagesIn),
%			% Choose Layout (Business Rule: Volgorde Artikel_Layouts moet gevolgd worden)
%		Article = article{layouts:Layouts},
%		member(Layout, Layouts),
%			% Choose Anchor
%%		(
%%			var(FixAnchor) ->
%			Page = page{anchors:Anchors},
%			member(Anchor, Anchors),
%%		;
%%			Anchor = FixAnchor
%%		),
%			% Choose Direction
%		Directions = [dr, dl, ur, ul],
%		member(Direction, Directions),
%			% Get (partial) Allocation
%		getAllocationRectangle(Direction, Page, Anchor, Layout,    Allocation),
%			% Check validity of Allocation
%		isValidAllocation(Allocation, Article),
%			% Check overlap w/ existing allocations
%		Page = page{allocations:Allocations},
%		noOverlap(Allocation, Allocations),
%			%
%			% Do Allocation
%		Allocation = allocation{article:Article},
%		doAllocation(Allocation, Page, Page0),
%			% Out Params
%		replace(PagesIn, Page, Page0, Pages1),
%			% Article placed, remove it
%		delete(Article, ArticlesIn, Articles1),
%			% Recursive call
%		doArticles(Pages1, Articles1, FixAnchor, PagesOut, ArticlesOut)
%	;
%			% Unable to place remaining articles
%		ArticlesOut = ArticlesIn,
%		PagesOut = PagesIn
%	).

% doAllocation: actually allocate this Allocation on this PageIn, resulting in PageOut
doAllocation(Allocation, PageIn,   PageOut) :-
	Allocation = allocation{sx:SX, sy:SY, ex:EX, ey:EY},
	PageIn = page{anchors:OldAnchors, allocations:OldAllocations},
		% Merge anchors to form NewAnchors (no duplicates: < instead of =<)
	ExtraAnchors = [anchor{x:SX, y:SY}, anchor{x:SX, y:EY}, anchor{x:EX, y:SY}, anchor{x:EX, y:EY}],
	merge(0, <, OldAnchors, ExtraAnchors, NewAnchors),
		% New allocations
	NewAllocation = [Allocation | OldAllocations],
		% Create new Page
	update_struct(page, [anchors:NewAnchors, allocations:NewAllocation], PageIn, PageOut).

% isValidAllocation. BusinessRule: Kopstukken beginnen alleen op SY==0
isValidAllocation(Allocation, article{type:kopstuk}) :- !, Allocation = allocation{sy:0}.
isValidAllocation(_, _).

% getAllocationRectangle DownRight
getAllocationRectangle(dr, page{width:PW, height:PH}, anchor{x:SX, y:SY}, layout{width:AW, height:AH},   allocation{sx:SX, sy:SY, ex:EX, ey:EY}) :-
	EX is SX + AW, EY is SY + AH,
	EX =< PW, EY =< PH.
	
% getAllocationRectangle DownLeft
getAllocationRectangle(dl, page{height:PH}, anchor{x:EX, y:SY}, layout{width:AW, height:AH},   allocation{sx:SX, sy:SY, ex:EX, ey:EY}) :-
	SX is EX - AW, EY is SY + AH,
	SX >= 0, EY =< PH.	

% getAllocationRectangle UpRight
getAllocationRectangle(ur, page{width:PW}, anchor{x:SX, y:EY}, layout{width:AW, height:AH},   allocation{sx:SX, sy:SY, ex:EX, ey:EY}) :-
	SY is EY - AH, EX is SX + AW,
	SY >= 0, EX =< PW.

% getAllocationRectangle UpLeft
getAllocationRectangle(ul, _, anchor{x:EX, y:EY}, layout{width:AW, height:AH},   allocation{sx:SX, sy:SY, ex:EX, ey:EY}) :-
	SX is EX - AW, SY is EY - AH,
	SX >= 0, SY >= 0.

% noOverlap. Check if the given rectangle does not overlap with any other articles already allocated.
noOverlap(NewAllocation, [ExistingAllocation | OtherArticleAllocations]) :-
	not(overlaps(NewAllocation, ExistingAllocation)),
	noOverlap(NewAllocation, OtherArticleAllocations).
noOverlap(_, []).

%checkOverlap w/ 4 overloads: Check if two given rectangles ([NASX, NASY], [NAEX, NAEY] ; [OASX, OASY], [OAEX, OAEY]) overlap
overlaps(allocation{ex:NAEX}, allocation{sx:OASX}) :- NAEX =< OASX, !, fail.
overlaps(allocation{ey:NAEY}, allocation{sy:OASY}) :- NAEY =< OASY, !, fail.
overlaps(allocation{sx:NASX}, allocation{ex:OAEX}) :- NASX >= OAEX, !, fail.
overlaps(allocation{sy:NASY}, allocation{ey:OAEY}) :- NASY >= OAEY, !, fail.
overlaps(_, _).

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

convertPages([], A, [], A).
convertPages([RawPage | OtherRawPages], ArticlesIn,   PagesOut, ArticlesOut) :-
	RawPage = pagein{id:Id, kopstukid:KopstukId, isleft:_, artikelslinks:_, margex:MargeX, margey:MargeY, usewidth:Width0, useheight:Height0, basislijnhoogte:RowHeight, ads:Ads},
		% Create new page
	Width is 6,
	ColWidth is Width0 / Width,
	Height is integer(round(Height0 / RowHeight)),
	EmptyPageAnchors = [anchor{x:0, y:0}, anchor{x:0, y:Height}, anchor{x:Width, y:0}, anchor{x:Width, y:Height}],
	Page0 = page{id:Id, width:6, height:Height, anchors:EmptyPageAnchors, allocations:[]},
		% Put Ads
	putAds(Ads, MargeX, MargeY, ColWidth, RowHeight, Page0,   Page1),
		% Put Reserved Kopstuk
	putKopstuk(Page1, KopstukId, ArticlesIn,   Page2, Articles2),
		% Put Photo Articles
	findall(PhotoArticle, 
		(
			member(PhotoArticle, Articles2), 
			PhotoArticle = article{type:fotoartikel}
		),
		PhotoArticles),
	trace(putPhotoArticles(Page2, PhotoArticles,   Page3, Articles3)),
	%writeln(Page2), writeln(PhotoArticles), writeln(Page3), writeln(Articles3),
	%Page3 = Page2, Articles3 = Articles2,
		%
	convertPages(OtherRawPages, Articles3,   PagesOutTemp, ArticlesOut),
	PagesOut = [Page3 | PagesOutTemp].

% putAds: Put Advertisements on Page
putAds([], _, _, _, _, A, A).
putAds([Ad | OtherAds], MargeX, MargeY, ColWidth, RowHeight, PageIn,   PageOut) :-
	Ad = ad{id:AdId, x:X, y:Y, width:Width, height:Height},
		%
	SX is integer(round((X - MargeX) / ColWidth)),
	SY is integer(round((Y - MargeY) / RowHeight)),
	EX is SX + integer(round(Width / ColWidth)),
	EY is SY + integer(round(Height / RowHeight)),
		%
	Allocation = allocation{layoutid:0, sx:SX, sy:SY, ex:EX, ey:EY, article:Ad},
	AdAnchors = [anchor{x:SX, y:SY}, anchor{x:SX, y:EY}, anchor{x:EX, y:SY}, anchor{x:EX, y:EY}],
		% Merge to form NewAnchors (no duplicates: < instead of =<)
	PageIn = page{anchors:OldAnchors, allocations:OldAllocations},
	merge(0, <, OldAnchors, AdAnchors, NewAnchors),
		% Add Ad to Page
	NewAllocations = [Allocation | OldAllocations],
		% Create new Page
	update_struct(page, [anchors:NewAnchors, allocations:NewAllocations], PageIn, PageOutTemp),
		%
	putAds(OtherAds, MargeX, MargeY, ColWidth, RowHeight, PageOutTemp, PageOut).	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			UTILS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% replace: Replace the first occurence (OldList, OldElement, NewElement, NewList)
replace([A | B], A, C, [C | B]) :- !.
replace([A | B], D, C, [A | E]) :-
	replace(B, D, C, E).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%			RUBBISH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

printMatlab([ThisPage | OtherPages]) :-
	ThisPage = page{allocations:Articles},
	write('P'), 
	B is 7 - length([ThisPage | OtherPages]), 
	write(B), 
	write(' = ['),
	printMatlabPage(Articles),
	writeln('];'),
		%
	printMatlab(OtherPages).
printMatlab([]).	

printMatlabPage([ThisArticle | OtherArticles]) :-
	ThisArticle = allocation{layoutid:LId, sx:SX, sy:SY, ex:EX, ey:EY, article:Content},
	(
		Content = article{id:Id, type:Type0}, getTypeCode(Type0, Type)	
	;
		Content = ad{id:Id}, Type=0
	),
	write([Id, SX, SY, EX, EY, Type]), 
	(length(OtherArticles, 0) -> true ; write('; ')),
	printMatlabPage(OtherArticles).
printMatlabPage([]).

getTypeCode(kopstuk, 1) :- !.
getTypeCode(normaal, 2) :- !.
getTypeCode(kortje, 3) :- !.
getTypeCode(_, 2) :- !.