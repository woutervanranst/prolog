%		struct(page(id, pageposition, width, height, anchors, articles)),
%		struct(ad(id, x, y, width, height)),
%		struct(article(id, type, plaatsing, layouts)),
%		struct(layout(id, width, height)),
%		struct(allocation(pageid, artid, layoutid, sx, sy, ex, ey, score)),
%		struct(anchor(x, y)).

:- local
		struct(pagein(id, isleft, artikelslinks, margex, margey, usewidth, useheight, ads)),
		struct(ad(id, x, y, width, height)),
			%
		struct(article(id, type, plaatsing, layouts)),
		struct(layout(id, width, height)).
		
loadPages(Pages) :-
	Pages = [
		pagein{margex:35.4325, isleft:0, ads:[], artikelslinks:false, useheight:1132.025856, usewidth:822.034, margey:150.630644, id:5001}, 
		pagein{margex:35.4325, isleft:1, ads:[ad{x:35.433, height:73.7, width:266.452, y:1208.957, id:5015}], artikelslinks:true, useheight:1208.8236738, usewidth:822.034, margey:73.8328262, id:4995}, 
		pagein{margex:35.4325, isleft:0, ads:[], artikelslinks:false, useheight:1208.8236738, usewidth:822.034, margey:73.8328262, id:4997}, 
		pagein{margex:35.4325, isleft:1, ads:[], artikelslinks:true, useheight:1208.8236738, usewidth:822.034, margey:73.8328262, id:4999}].

%loadPages(Pages) :-
%	Pages = [
%		page(id(5001), isleft(0), artikelslinks(false), margex(35.4325), margey(150.630644), usewidth(822.034), useheight(1132.025856), []),
%		page(id(4995), isleft(1), artikelslinks(true), margex(35.4325), margey(73.8328262), usewidth(822.034), useheight(1208.8236738), 
%			%[ad(id(5015), x(35.433), y(1208.957), width(266.452), height(73.7))]),
%			[ad(id(5015), x(35.433), y(1135.275), width(266.452), height(73.7))]),
%		page(id(4997), isleft(0), artikelslinks(false), margex(35.4325), margey(73.8328262), usewidth(822.034), useheight(1208.8236738), []),
%		page(id(4999), isleft(1), artikelslinks(true), margex(35.4325), margey(73.8328262), usewidth(822.034), useheight(1208.8236738), [])
%		].

loadArticles(Articles) :-
	Articles = [
		article{type:kopstuk, layouts:
			[layout{height:529.0, width:683.139, id:31075}, 
			layout{height:529.0, width:683.139, id:31074}, 
			layout{height:529.0, width:683.139, id:31072}, 
			layout{height:625.0, width:544.243, id:31073}], 
		plaatsing:m, id:11490}, 
		
		article{type:kopstuk, layouts:[layout{height:489.0, width:683.139, id:30927}, layout{height:489.0, width:683.139, id:30926}, layout{height:491.0, width:683.139, id:30928}], plaatsing:m, id:11491}, 
		article{type:kopstuk, layouts:[layout{height:452.0, width:683.139, id:30933}, layout{height:452.0, width:683.139, id:30932}], plaatsing:m, id:11400}, 
		article{type:kopstuk, layouts:[layout{height:443.0, width:683.139, id:30922}, layout{height:443.0, width:683.139, id:30921}, layout{height:443.0, width:683.139, id:30920}], plaatsing:m, id:11426}, 
		article{type:kopstuk, layouts:[layout{height:443.0, width:683.139, id:30931}, layout{height:443.0, width:683.139, id:30930}, layout{height:443.0, width:683.139, id:30929}], plaatsing:m, id:11383}, 
		article{type:kopstuk, layouts:[layout{height:539.0, width:544.243, id:30935}, layout{height:539.0, width:544.243, id:30934}], plaatsing:m, id:11425}, 
		article{type:normaal, layouts:[layout{height:319.0, width:405.348, id:31057}, layout{height:319.0, width:405.348, id:31056}, layout{height:436.0, width:266.452, id:31055}, layout{height:436.0, width:266.452, id:31054}, layout{height:436.0, width:266.452, id:31053}], plaatsing:v, id:11509}, 
		article{type:normaal, layouts:[layout{height:235.0, width:405.348, id:31043}, layout{height:235.0, width:405.348, id:31041}, layout{height:235.0, width:405.348, id:31040}, layout{height:205.0, width:544.243, id:31042}], plaatsing:v, id:11387}, 
		article{type:normaal, layouts:[layout{height:319.0, width:266.452, id:31065}, layout{height:331.0, width:266.452, id:31064}, layout{height:331.0, width:266.452, id:31063}], plaatsing:v, id:11500}, 
		article{type:normaal, layouts:[layout{height:406.0, width:544.243, id:31044}], plaatsing:m, id:11361}, 
		article{type:normaal, layouts:[layout{height:292.0, width:544.243, id:31166}, layout{height:292.0, width:544.243, id:31165}, layout{height:292.0, width:544.243, id:31164}, layout{height:379.0, width:405.348, id:31167}, layout{height:379.0, width:405.348, id:31163}], plaatsing:m, id:11501}, 
		article{type:normaal, layouts:[layout{height:262.0, width:405.348, id:31000}, layout{height:262.0, width:405.348, id:30999}, layout{height:358.0, width:266.452, id:30998}, layout{height:358.0, width:266.452, id:30997}, layout{height:358.0, width:266.452, id:30996}], plaatsing:m, id:11431}, 
		article{type:normaal, layouts:[layout{height:349.0, width:266.452, id:31021}, layout{height:358.0, width:266.452, id:31020}, layout{height:358.0, width:266.452, id:31019}], plaatsing:m, id:11385}, 
		article{type:normaal, layouts:[layout{height:310.0, width:266.452, id:30986}, layout{height:319.0, width:266.452, id:30985}, layout{height:319.0, width:266.452, id:30984}], plaatsing:m, id:11389}, 
		article{type:normaal, layouts:[layout{height:292.0, width:266.452, id:31003}, layout{height:292.0, width:266.452, id:31002}, layout{height:292.0, width:266.452, id:31001}], plaatsing:m, id:11486}, 
		article{type:normaal, layouts:[layout{height:233.0, width:266.452, id:31069}, layout{height:243.0, width:266.452, id:31067}, layout{height:243.0, width:266.452, id:31066}, layout{height:185.0, width:405.348, id:31071}, layout{height:185.0, width:405.348, id:31070}, layout{height:185.0, width:405.348, id:31068}], plaatsing:m, id:11510}, 
		article{type:normaal, layouts:[layout{height:232.0, width:266.452, id:30993}, layout{height:232.0, width:266.452, id:30991}, layout{height:232.0, width:266.452, id:30990}, layout{height:193.0, width:405.348, id:30995}, layout{height:193.0, width:405.348, id:30994}, layout{height:193.0, width:405.348, id:30992}], plaatsing:m, id:11386}, 
		article{type:normaal, layouts:[layout{height:214.0, width:266.452, id:30979}, layout{height:214.0, width:266.452, id:30978}, layout{height:223.0, width:266.452, id:30981}, layout{height:175.0, width:405.348, id:30983}, layout{height:175.0, width:405.348, id:30982}, layout{height:175.0, width:405.348, id:30980}], plaatsing:m, id:11376}, 
		article{type:normaal, layouts:[layout{height:184.0, width:266.452, id:31010}, layout{height:205.0, width:266.452, id:31008}, layout{height:205.0, width:266.452, id:31007}, layout{height:166.0, width:405.348, id:31012}, layout{height:166.0, width:405.348, id:31011}, layout{height:166.0, width:405.348, id:31009}], plaatsing:m, id:11503}, 
		article{type:normaal, layouts:[layout{height:187.0, width:266.452, id:30975}, layout{height:196.0, width:266.452, id:30973}, layout{height:196.0, width:266.452, id:30972}, layout{height:148.0, width:405.348, id:30977}, layout{height:148.0, width:405.348, id:30976}, layout{height:148.0, width:405.348, id:30974}], plaatsing:m, id:11432}, 
		article{type:normaal, layouts:[layout{height:193.0, width:266.452, id:30939}, layout{height:193.0, width:266.452, id:30937}, layout{height:193.0, width:266.452, id:30936}, layout{height:155.0, width:405.348, id:30941}, layout{height:155.0, width:405.348, id:30940}, layout{height:155.0, width:405.348, id:30938}], plaatsing:m, id:11430}, 
		article{type:normaal, layouts:[layout{height:175.0, width:266.452, id:30988}, layout{height:175.0, width:266.452, id:30987}, layout{height:187.0, width:266.452, id:30989}], plaatsing:m, id:11441}, 
		article{type:normaal, layouts:[layout{height:156.0, width:266.452, id:30947}, layout{height:156.0, width:266.452, id:30946}, layout{height:156.0, width:266.452, id:30945}], plaatsing:m, id:11488}, 
		article{type:normaal, layouts:[layout{height:252.0, width:405.348, id:30952}, layout{height:252.0, width:405.348, id:30951}, layout{height:339.0, width:266.452, id:30950}, layout{height:348.0, width:266.452, id:30949}, layout{height:348.0, width:266.452, id:30948}], plaatsing:v, id:11423}, 
		article{type:normaal, layouts:[layout{height:252.0, width:266.452, id:30954}, layout{height:252.0, width:266.452, id:30953}, layout{height:185.0, width:405.348, id:30956}, layout{height:185.0, width:405.348, id:30955}], plaatsing:v, id:11429}, 
		article{type:normaal, layouts:[layout{height:166.0, width:266.452, id:30961}, layout{height:166.0, width:266.452, id:30960}, layout{height:156.0, width:266.452, id:30962}, layout{height:137.0, width:405.348, id:30963}], plaatsing:v, id:11362}, 
		article{type:normaal, layouts:[layout{height:253.0, width:405.348, id:31028}, layout{height:253.0, width:405.348, id:31024}, layout{height:253.0, width:405.348, id:31023}, layout{height:205.0, width:544.243, id:31027}, layout{height:205.0, width:544.243, id:31026}, layout{height:205.0, width:544.243, id:31025}], plaatsing:m, id:11371}, 
		article{type:normaal, layouts:[layout{height:243.0, width:266.452, id:30852}, layout{height:243.0, width:266.452, id:30850}, layout{height:243.0, width:266.452, id:30849}, layout{height:185.0, width:405.348, id:30854}, layout{height:185.0, width:405.348, id:30853}, layout{height:185.0, width:405.348, id:30851}], plaatsing:m, id:11497}, 
		article{type:normaal, layouts:[layout{height:175.0, width:266.452, id:30861}, layout{height:185.0, width:266.452, id:30859}, layout{height:185.0, width:266.452, id:30858}, layout{height:147.0, width:405.348, id:30863}, layout{height:147.0, width:405.348, id:30862}, layout{height:147.0, width:405.348, id:30860}], plaatsing:m, id:11424}, 
		article{type:normaal, layouts:[layout{height:252.0, width:405.348, id:30841}, layout{height:252.0, width:405.348, id:30837}, layout{height:252.0, width:405.348, id:30836}, layout{height:204.0, width:544.243, id:30840}, layout{height:204.0, width:544.243, id:30839}, layout{height:204.0, width:544.243, id:30838}], plaatsing:a, id:11421}, 
		article{type:normaal, layouts:[layout{height:339.0, width:266.452, id:30848}, layout{height:339.0, width:266.452, id:30847}], plaatsing:a, id:11487}, 
		article{type:normaal, layouts:[layout{height:244.0, width:405.348, id:31062}, layout{height:244.0, width:405.348, id:31061}, layout{height:319.0, width:266.452, id:31060}, layout{height:331.0, width:266.452, id:31059}, layout{height:331.0, width:266.452, id:31058}], plaatsing:m, id:11375}, 
		article{type:normaal, layouts:[layout{height:175.0, width:266.452, id:30868}, layout{height:175.0, width:266.452, id:30867}, layout{height:166.0, width:266.452, id:30870}, layout{height:137.0, width:405.348, id:30872}, layout{height:137.0, width:405.348, id:30871}, layout{height:137.0, width:405.348, id:30869}], plaatsing:m, id:11398}, 
		article{type:normaal, layouts:[layout{height:175.0, width:266.452, id:30917}, layout{height:175.0, width:266.452, id:30915}, layout{height:175.0, width:266.452, id:30914}, layout{height:137.0, width:405.348, id:30919}, layout{height:137.0, width:405.348, id:30918}, layout{height:137.0, width:405.348, id:30916}], plaatsing:m, id:11440}, 
		article{type:normaal, layouts:[layout{height:166.0, width:266.452, id:30865}, layout{height:166.0, width:266.452, id:30864}, layout{height:156.0, width:266.452, id:30866}], plaatsing:m, id:11381}, 
		article{type:kortje, layouts:[layout{height:337.0, width:127.557, id:30888}], plaatsing:v, id:11422}, 
		article{type:kortje, layouts:[layout{height:271.0, width:127.557, id:30890}], plaatsing:v, id:11502}, 
		article{type:kortje, layouts:[layout{height:183.0, width:127.557, id:30873}], plaatsing:v, id:11427}, 
		article{type:kortje, layouts:[layout{height:243.0, width:127.557, id:30891}], plaatsing:m, id:11506}, 
		article{type:kortje, layouts:[layout{height:195.0, width:127.557, id:30889}], plaatsing:m, id:11467}, 
		article{type:kortje, layouts:[layout{height:147.0, width:127.557, id:30875}], plaatsing:m, id:11373}, 
		article{type:kortje, layouts:[layout{height:137.0, width:127.557, id:30877}], plaatsing:m, id:11372}, 
		article{type:kortje, layouts:[layout{height:135.0, width:127.557, id:30892}], plaatsing:m, id:11461}, 
		article{type:kortje, layouts:[layout{height:127.0, width:127.557, id:30965}], plaatsing:m, id:11462}, 
		article{type:kortje, layouts:[layout{height:118.0, width:127.557, id:30964}], plaatsing:m, id:11459}, 
		article{type:kortje, layouts:[layout{height:118.0, width:127.557, id:30879}], plaatsing:m, id:11463}, 
		article{type:kortje, layouts:[layout{height:118.0, width:127.557, id:30883}], plaatsing:m, id:11452}, 
		article{type:kortje, layouts:[layout{height:118.0, width:127.557, id:30884}], plaatsing:m, id:11453}, 
		article{type:kortje, layouts:[layout{height:108.0, width:127.557, id:30878}], plaatsing:m, id:11449}, 
		article{type:kortje, layouts:[layout{height:108.0, width:127.557, id:30885}], plaatsing:m, id:11455}, 
		article{type:kortje, layouts:[layout{height:108.0, width:127.557, id:30887}], plaatsing:m, id:11460}, 
		article{type:kortje, layouts:[layout{height:99.0, width:127.557, id:30880}], plaatsing:m, id:11464}, 
		article{type:kortje, layouts:[layout{height:99.0, width:127.557, id:30881}], plaatsing:m, id:11450}, 
		article{type:kortje, layouts:[layout{height:70.0, width:127.557, id:30886}], plaatsing:m, id:11456}, 
		article{type:kortje, layouts:[layout{height:108.0, width:127.557, id:30882}], plaatsing:a, id:11451}, 
		article{type:kortje, layouts:[layout{height:262.0, width:127.557, id:30896}], plaatsing:m, id:11494}, 
		article{type:kortje, layouts:[layout{height:252.0, width:127.557, id:30897}], plaatsing:m, id:11499}, 
		article{type:kortje, layouts:[layout{height:70.0, width:127.557, id:30895}], plaatsing:m, id:11457}, 
		article{type:kortje, layouts:[layout{height:195.0, width:127.557, id:30904}], plaatsing:m, id:11493}, 
		article{type:kortje, layouts:[layout{height:271.0, width:127.557, id:30898}], plaatsing:a, id:11382}, 
		article{type:kortje, layouts:[layout{height:244.0, width:127.557, id:31051}], plaatsing:a, id:11489}, 
		article{type:kortje, layouts:[layout{height:243.0, width:127.557, id:30900}], plaatsing:a, id:11374}, 
		article{type:kortje, layouts:[layout{height:214.0, width:127.557, id:30899}], plaatsing:a, id:11390}, 
		article{type:kortje, layouts:[layout{height:214.0, width:127.557, id:30901}], plaatsing:a, id:11442}, 
		article{type:kortje, layouts:[layout{height:196.0, width:127.557, id:31052}], plaatsing:a, id:11391}, 
		article{type:kortje, layouts:[layout{height:195.0, width:127.557, id:30902}], plaatsing:a, id:11384}].


%	Articles = [
%		artikel(id(11490), type(kopstuk), plaatsing(m), [
%			layout(id(31075), width(683.139), height(529.0)), 
%			layout(id(31074), width(683.139), height(529.0)), 
%			layout(id(31072), width(683.139), height(529.0)), 
%			layout(id(31073), width(544.243), height(625.0))]),
%		artikel(id(11491), type(kopstuk), plaatsing(m), [
%			layout(id(30927), width(683.139), height(489.0)), 
%			layout(id(30926), width(683.139), height(489.0)), 
%			layout(id(30928), width(683.139), height(491.0))]),
%		artikel(id(11400), type(kopstuk), plaatsing(m), [
%			layout(id(30933), width(683.139), height(452.0)), 
%			layout(id(30932), width(683.139), height(452.0))]),
%		artikel(id(11426), type(kopstuk), plaatsing(m), [	
%			layout(id(30922), width(683.139), height(443.0)), 
%			layout(id(30921), width(683.139), height(443.0)), 
%			layout(id(30920), width(683.139), height(443.0))]),
%		artikel(id(11383), type(kopstuk), plaatsing(m), [
%			layout(id(30931), width(683.139), height(443.0)), 
%			layout(id(30930), width(683.139), height(443.0)), 
%			layout(id(30929), width(683.139), height(443.0))]),
%		artikel(id(11425), type(kopstuk), plaatsing(m), [
%			layout(id(30935), width(544.243), height(539.0)), 
%			layout(id(30934), width(544.243), height(539.0))]),
%		artikel(id(11509), type(normaal), plaatsing(v), [
%			layout(id(31057), width(405.348), height(319.0)), 
%			layout(id(31056), width(405.348), height(319.0)), 
%			layout(id(31055), width(266.452), height(436.0)), 
%			layout(id(31054), width(266.452), height(436.0)), 
%			layout(id(31053), width(266.452), height(436.0))]),
%		artikel(id(11387), type(normaal), plaatsing(v), [
%			layout(id(31043), width(405.348), height(235.0)), 
%			layout(id(31041), width(405.348), height(235.0)), 
%			layout(id(31040), width(405.348), height(235.0)), 
%			layout(id(31042), width(544.243), height(205.0))]),
%		artikel(id(11500), type(normaal), plaatsing(v), [
%			layout(id(31065), width(266.452), height(319.0)), 
%			layout(id(31064), width(266.452), height(331.0)), 
%			layout(id(31063), width(266.452), height(331.0))]),
%		artikel(id(11361), type(normaal), plaatsing(m), [
%			layout(id(31044), width(544.243), height(406.0))]),
%		artikel(id(11501), type(normaal), plaatsing(m), [
%			layout(id(31166), width(544.243), height(292.0)), 
%			layout(id(31165), width(544.243), height(292.0)), 
%			layout(id(31164), width(544.243), height(292.0)), 
%			layout(id(31167), width(405.348), height(379.0)), 
%			layout(id(31163), width(405.348), height(379.0))]),
%		artikel(id(11431), type(normaal), plaatsing(m), [
%			layout(id(31000), width(405.348), height(262.0)), 
%			layout(id(30999), width(405.348), height(262.0)), 
%			layout(id(30998), width(266.452), height(358.0)), 
%			layout(id(30997), width(266.452), height(358.0)), 
%			layout(id(30996), width(266.452), height(358.0))]),
%		artikel(id(11385), type(normaal), plaatsing(m), [
%			layout(id(31021), width(266.452), height(349.0)), 
%			layout(id(31020), width(266.452), height(358.0)), 
%			layout(id(31019), width(266.452), height(358.0))]),
%		artikel(id(11389), type(normaal), plaatsing(m), [
%			layout(id(30986), width(266.452), height(310.0)), 
%			layout(id(30985), width(266.452), height(319.0)), 
%			layout(id(30984), width(266.452), height(319.0))]),
%		artikel(id(11486), type(normaal), plaatsing(m), [
%			layout(id(31003), width(266.452), height(292.0)), 
%			layout(id(31002), width(266.452), height(292.0)), 
%			layout(id(31001), width(266.452), height(292.0))]),
%		artikel(id(11510), type(normaal), plaatsing(m), [
%			layout(id(31069), width(266.452), height(233.0)), 
%			layout(id(31067), width(266.452), height(243.0)), 
%			layout(id(31066), width(266.452), height(243.0)), 
%			layout(id(31071), width(405.348), height(185.0)), 
%			layout(id(31070), width(405.348), height(185.0)), 
%			layout(id(31068), width(405.348), height(185.0))]),
%		artikel(id(11386), type(normaal), plaatsing(m), [
%			layout(id(30993), width(266.452), height(232.0)), 
%			layout(id(30991), width(266.452), height(232.0)), 
%			layout(id(30990), width(266.452), height(232.0)), 
%			layout(id(30995), width(405.348), height(193.0)), 
%			layout(id(30994), width(405.348), height(193.0)), 
%			layout(id(30992), width(405.348), height(193.0))]),
%		artikel(id(11376), type(normaal), plaatsing(m), [
%			layout(id(30979), width(266.452), height(214.0)), 
%			layout(id(30978), width(266.452), height(214.0)), 
%			layout(id(30981), width(266.452), height(223.0)), 
%			layout(id(30983), width(405.348), height(175.0)), 
%			layout(id(30982), width(405.348), height(175.0)), 
%			layout(id(30980), width(405.348), height(175.0))]),
%		artikel(id(11503), type(normaal), plaatsing(m), [
%			layout(id(31010), width(266.452), height(184.0)), 
%			layout(id(31008), width(266.452), height(205.0)), 
%			layout(id(31007), width(266.452), height(205.0)), 
%			layout(id(31012), width(405.348), height(166.0)), 
%			layout(id(31011), width(405.348), height(166.0)), 
%			layout(id(31009), width(405.348), height(166.0))]),
%		artikel(id(11432), type(normaal), plaatsing(m), [
%			layout(id(30975), width(266.452), height(187.0)), 
%			layout(id(30973), width(266.452), height(196.0)), 
%			layout(id(30972), width(266.452), height(196.0)), 
%			layout(id(30977), width(405.348), height(148.0)), 
%			layout(id(30976), width(405.348), height(148.0)), 
%			layout(id(30974), width(405.348), height(148.0))]),
%		artikel(id(11430), type(normaal), plaatsing(m), [
%			layout(id(30939), width(266.452), height(193.0)), 
%			layout(id(30937), width(266.452), height(193.0)), 
%			layout(id(30936), width(266.452), height(193.0)), 
%			layout(id(30941), width(405.348), height(155.0)), 
%			layout(id(30940), width(405.348), height(155.0)), 
%			layout(id(30938), width(405.348), height(155.0))]),
%		artikel(id(11441), type(normaal), plaatsing(m), [
%			layout(id(30988), width(266.452), height(175.0)), 
%			layout(id(30987), width(266.452), height(175.0)), 
%			layout(id(30989), width(266.452), height(187.0))]),
%		artikel(id(11488), type(normaal), plaatsing(m), [
%			layout(id(30947), width(266.452), height(156.0)), 
%			layout(id(30946), width(266.452), height(156.0)), 
%			layout(id(30945), width(266.452), height(156.0))]),
%		artikel(id(11423), type(normaal), plaatsing(v), [
%			layout(id(30952), width(405.348), height(252.0)), 
%			layout(id(30951), width(405.348), height(252.0)), 
%			layout(id(30950), width(266.452), height(339.0)), 
%			layout(id(30949), width(266.452), height(348.0)), 
%			layout(id(30948), width(266.452), height(348.0))]),
%		artikel(id(11429), type(normaal), plaatsing(v), [
%			layout(id(30954), width(266.452), height(252.0)), 
%			layout(id(30953), width(266.452), height(252.0)), 
%			layout(id(30956), width(405.348), height(185.0)), 
%			layout(id(30955), width(405.348), height(185.0))]),
%		artikel(id(11362), type(normaal), plaatsing(v), [
%			layout(id(30961), width(266.452), height(166.0)), 
%			layout(id(30960), width(266.452), height(166.0)), 
%			layout(id(30962), width(266.452), height(156.0)), 
%			layout(id(30963), width(405.348), height(137.0))]),
%		artikel(id(11371), type(normaal), plaatsing(m), [
%			layout(id(31028), width(405.348), height(253.0)), 
%			layout(id(31024), width(405.348), height(253.0)), 
%			layout(id(31023), width(405.348), height(253.0)), 
%			layout(id(31027), width(544.243), height(205.0)), 
%			layout(id(31026), width(544.243), height(205.0)), 
%			layout(id(31025), width(544.243), height(205.0))]),
%		artikel(id(11497), type(normaal), plaatsing(m), [
%			layout(id(30852), width(266.452), height(243.0)), 
%			layout(id(30850), width(266.452), height(243.0)), 
%			layout(id(30849), width(266.452), height(243.0)), 
%			layout(id(30854), width(405.348), height(185.0)), 
%			layout(id(30853), width(405.348), height(185.0)), 
%			layout(id(30851), width(405.348), height(185.0))]),
%		artikel(id(11424), type(normaal), plaatsing(m), [
%			layout(id(30861), width(266.452), height(175.0)), 
%			layout(id(30859), width(266.452), height(185.0)), 
%			layout(id(30858), width(266.452), height(185.0)), 
%			layout(id(30863), width(405.348), height(147.0)), 
%			layout(id(30862), width(405.348), height(147.0)), 
%			layout(id(30860), width(405.348), height(147.0))]),
%		artikel(id(11421), type(normaal), plaatsing(a), [
%			layout(id(30841), width(405.348), height(252.0)), 
%			layout(id(30837), width(405.348), height(252.0)), 
%			layout(id(30836), width(405.348), height(252.0)), 
%			layout(id(30840), width(544.243), height(204.0)), 
%			layout(id(30839), width(544.243), height(204.0)), 
%			layout(id(30838), width(544.243), height(204.0))]),
%		artikel(id(11487), type(normaal), plaatsing(a), [
%			layout(id(30848), width(266.452), height(339.0)), 
%			layout(id(30847), width(266.452), height(339.0))]),
%		artikel(id(11375), type(normaal), plaatsing(m), [
%			layout(id(31062), width(405.348), height(244.0)), 
%			layout(id(31061), width(405.348), height(244.0)), 
%			layout(id(31060), width(266.452), height(319.0)), 
%			layout(id(31059), width(266.452), height(331.0)), 
%			layout(id(31058), width(266.452), height(331.0))]),
%		artikel(id(11398), type(normaal), plaatsing(m), [
%			layout(id(30868), width(266.452), height(175.0)), 
%			layout(id(30867), width(266.452), height(175.0)), 
%			layout(id(30870), width(266.452), height(166.0)), 
%			layout(id(30872), width(405.348), height(137.0)), 
%			layout(id(30871), width(405.348), height(137.0)), 
%			layout(id(30869), width(405.348), height(137.0))]),
%		artikel(id(11440), type(normaal), plaatsing(m), [
%			layout(id(30917), width(266.452), height(175.0)), 
%			layout(id(30915), width(266.452), height(175.0)), 
%			layout(id(30914), width(266.452), height(175.0)), 
%			layout(id(30919), width(405.348), height(137.0)), 
%			layout(id(30918), width(405.348), height(137.0)), 
%			layout(id(30916), width(405.348), height(137.0))]),
%		artikel(id(11381), type(normaal), plaatsing(m), [
%			layout(id(30865), width(266.452), height(166.0)), 
%			layout(id(30864), width(266.452), height(166.0)), 
%			layout(id(30866), width(266.452), height(156.0))]),
%		artikel(id(11422), type(kortje), plaatsing(v), [
%			layout(id(30888), width(127.557), height(337.0))]),
%		artikel(id(11502), type(kortje), plaatsing(v), [
%			layout(id(30890), width(127.557), height(271.0))]),
%		artikel(id(11427), type(kortje), plaatsing(v), [
%			layout(id(30873), width(127.557), height(183.0))]),
%		artikel(id(11506), type(kortje), plaatsing(m), [
%			layout(id(30891), width(127.557), height(243.0))]),
%		artikel(id(11467), type(kortje), plaatsing(m), [
%			layout(id(30889), width(127.557), height(195.0))]),
%		artikel(id(11373), type(kortje), plaatsing(m), [
%			layout(id(30875), width(127.557), height(147.0))]),
%		artikel(id(11372), type(kortje), plaatsing(m), [
%			layout(id(30877), width(127.557), height(137.0))]),
%		artikel(id(11461), type(kortje), plaatsing(m), [
%			layout(id(30892), width(127.557), height(135.0))]),
%		artikel(id(11462), type(kortje), plaatsing(m), [
%			layout(id(30965), width(127.557), height(127.0))]),
%		artikel(id(11459), type(kortje), plaatsing(m), [
%			layout(id(30964), width(127.557), height(118.0))]),
%		artikel(id(11463), type(kortje), plaatsing(m), [
%			layout(id(30879), width(127.557), height(118.0))]),
%		artikel(id(11452), type(kortje), plaatsing(m), [
%			layout(id(30883), width(127.557), height(118.0))]),
%		artikel(id(11453), type(kortje), plaatsing(m), [
%			layout(id(30884), width(127.557), height(118.0))]),
%		artikel(id(11449), type(kortje), plaatsing(m), [
%			layout(id(30878), width(127.557), height(108.0))]),
%		artikel(id(11455), type(kortje), plaatsing(m), [
%			layout(id(30885), width(127.557), height(108.0))]),
%		artikel(id(11460), type(kortje), plaatsing(m), [
%			layout(id(30887), width(127.557), height(108.0))]),
%		artikel(id(11464), type(kortje), plaatsing(m), [
%			layout(id(30880), width(127.557), height(99.0))]),
%		artikel(id(11450), type(kortje), plaatsing(m), [
%			layout(id(30881), width(127.557), height(99.0))]),
%		artikel(id(11456), type(kortje), plaatsing(m), [
%			layout(id(30886), width(127.557), height(70.0))]),
%		artikel(id(11451), type(kortje), plaatsing(a), [
%			layout(id(30882), width(127.557), height(108.0))]),
%		artikel(id(11494), type(kortje), plaatsing(m), [
%			layout(id(30896), width(127.557), height(262.0))]),
%		artikel(id(11499), type(kortje), plaatsing(m), [
%			layout(id(30897), width(127.557), height(252.0))]),
%		artikel(id(11457), type(kortje), plaatsing(m), [
%			layout(id(30895), width(127.557), height(70.0))]),
%		artikel(id(11493), type(kortje), plaatsing(m), [
%			layout(id(30904), width(127.557), height(195.0))]),
%		artikel(id(11382), type(kortje), plaatsing(a), [
%			layout(id(30898), width(127.557), height(271.0))]),
%		artikel(id(11489), type(kortje), plaatsing(a), [
%			layout(id(31051), width(127.557), height(244.0))]),
%		artikel(id(11374), type(kortje), plaatsing(a), [
%			layout(id(30900), width(127.557), height(243.0))]),
%		artikel(id(11390), type(kortje), plaatsing(a), [
%			layout(id(30899), width(127.557), height(214.0))]),
%		artikel(id(11442), type(kortje), plaatsing(a), [
%			layout(id(30901), width(127.557), height(214.0))]),
%		artikel(id(11391), type(kortje), plaatsing(a), [
%			layout(id(31052), width(127.557), height(196.0))]),
%		artikel(id(11384), type(kortje), plaatsing(a), [
%			layout(id(30902), width(127.557), height(195.0))])
%	].