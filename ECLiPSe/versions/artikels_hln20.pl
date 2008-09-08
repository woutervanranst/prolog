:- local
		struct(pagein(id, kopstukid, isleft, artikelslinks, margex, margey, usewidth, useheight, basislijnhoogte, ads)),
		struct(ad(id, x, y, width, height)),
		struct(article(id, type, plaatsing, kader, layouts)),
		struct(layout(id, width, height, components, photos)),
		struct(component(type, font, fontsize, x, y, eindx, eindy)),
		struct(photo(id, x, y, eindx, eindy, captionx, captiony, captioneindx, captioneindy)).

loadPages(Pages) :-
	Pages = [
		pagein{id:7909, kopstukid:16932, isleft:0, artikelslinks:false, margex:35.4325, margey:150.630644, usewidth:822.034, useheight:1132.025856, basislijnhoogte:9.6,
			ads:[ad{id:7469, x:591.014, y:1129.588, width:266.452, height:153.068}, 
			ad{id:7470, x:313.223, y:1140.927, width:266.452, height:141.73}]},
		pagein{id:7904, kopstukid:13906, isleft:1, artikelslinks:true, margex:35.4325, margey:73.8328262, usewidth:822.034, useheight:1208.8236738, basislijnhoogte:9.6,
			ads:[ad{id:7465, x:35.433, y:517.314, width:544.243, height:765.342}]},
		pagein{id:7905, kopstukid:16016, isleft:0, artikelslinks:false, margex:35.4325, margey:73.8328262, usewidth:822.034, useheight:1208.8236738, basislijnhoogte:9.6,
			ads:[]},
		pagein{id:7906, kopstukid:14002, isleft:1, artikelslinks:true, margex:35.4325, margey:73.8328262, usewidth:822.034, useheight:1208.8236738, basislijnhoogte:9.6,
			ads:[ad{id:7466, x:35.433, y:871.64, width:822.034, height:411.017}]},
		pagein{id:7907, kopstukid:14389, isleft:0, artikelslinks:false, margex:35.4325, margey:73.8328262, usewidth:822.034, useheight:1208.8236738, basislijnhoogte:9.6,
			ads:[ad{id:7467, x:452.119, y:659.045, width:405.348, height:623.612}]},
		pagein{id:7908, kopstukid:0, isleft:1, artikelslinks:true, margex:35.4325, margey:73.8328262, usewidth:822.034, useheight:1208.8236738, basislijnhoogte:9.6,
			ads:[ad{id:7468, x:35.433, y:35.432, width:822.034, height:1247.224}]}].

loadArticles(Articles) :-
	Articles = [
		article{id:14002, type:kopstuk, plaatsing:m, kader:true, layouts:
			[layout{
				id:148975, width:544.243, height:586.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:153.6, eindx:266.452, eindy:171.6},
					component{type:kop, font:"160 KOP kopstuk 75 pt (R/SPR)", fontsize:0, x:0.0, y:0.0, eindx:544.243, eindy:153.6},
					component{type:inleiding, font:"202 INL kopstuk", fontsize:0, x:0.0, y:153.6, eindx:266.452, eindy:269.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:153.6, eindx:544.243, eindy:586.6}],
				photos:
					[photo{id:5349, x:277.791, y:153.6, eindx:536.243, eindy:502.918, captionx:277.791, captiony:507.718, captioneindx:536.243, captioneindy:539.518}]
				}]
			},
		article{id:16016, type:kopstuk, plaatsing:m, kader:true, layouts:
			[layout{
				id:148979, width:683.139, height:625.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:86.4, eindx:132.357, eindy:104.4},
					component{type:kop, font:"160 KOP kopstuk 75 pt (R/SPR)", fontsize:78, x:0.0, y:0.0, eindx:683.139, eindy:86.4},
					component{type:inleiding, font:"202 INL kopstuk", fontsize:0, x:0.0, y:86.4, eindx:132.357, eindy:362.40000000000003},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:86.4, eindx:683.139, eindy:625.4}],
				photos:
					[photo{id:5353, x:143.695, y:86.4, eindx:675.139, eindy:448.874, captionx:143.695, captiony:448.874, captioneindx:675.139, captioneindy:465.874}]
				}]
			},
		article{id:14393, type:kopstuk, plaatsing:m, kader:true, layouts:
			[layout{
				id:148978, width:683.139, height:576.8, 
				components:
					[component{type:kop, font:"160 KOP kopstuk 75 pt (R/SPR)", fontsize:67, x:0.0, y:0.0, eindx:683.139, eindy:76.80000000000001},
					component{type:inleiding, font:"202 INL kopstuk", fontsize:0, x:0.0, y:76.80000000000001, eindx:132.357, eindy:400.8},
					component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:76.80000000000001, eindx:132.357, eindy:94.80000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:76.80000000000001, eindx:683.139, eindy:576.8}],
				photos:
					[photo{id:5352, x:143.695, y:76.80000000000001, eindx:675.139, eindy:413.982, captionx:143.695, captiony:418.78200000000004, captioneindx:675.139, captioneindy:440.58200000000005}]
				}]
			},
		article{id:16932, type:kopstuk, plaatsing:m, kader:true, layouts:
			[layout{
				id:148980, width:683.139, height:624.8, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:124.80000000000001, eindx:132.357, eindy:142.8},
					component{type:bovenkop, font:"501 Bijtitel", fontsize:0, x:0.0, y:0.0, eindx:683.139, eindy:38.00000000000001},
					component{type:kop, font:"160 KOP kopstuk 75 pt (R/SPR)", fontsize:78, x:0.0, y:38.00000000000001, eindx:683.139, eindy:124.80000000000001},
					component{type:inleiding, font:"202 INL kopstuk", fontsize:0, x:0.0, y:124.80000000000001, eindx:132.357, eindy:442.40000000000003},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:124.80000000000001, eindx:683.139, eindy:624.8}],
				photos:
					[photo{id:5354, x:143.695, y:124.80000000000001, eindx:675.139, eindy:488.28499999999997, captionx:143.695, captiony:488.28499999999997, captioneindx:675.139, captioneindy:505.28499999999997}]
				}]
			},
		article{id:13906, type:kopstuk, plaatsing:m, kader:true, layouts:
			[layout{
				id:148974, width:683.139, height:432.8, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:76.80000000000001, eindx:268.053, eindy:94.80000000000001},
					component{type:kop, font:"160 KOP kopstuk 75 pt (R/SPR)", fontsize:66, x:0.0, y:0.0, eindx:683.139, eindy:76.80000000000001},
					component{type:inleiding, font:"202 INL kopstuk", fontsize:0, x:0.0, y:76.80000000000001, eindx:268.053, eindy:192.8},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:76.80000000000001, eindx:683.139, eindy:432.8}],
				photos:
					[photo{id:5348, x:279.391, y:76.80000000000001, eindx:675.139, eindy:335.361, captionx:279.391, captiony:340.161, captioneindx:675.139, captioneindy:361.961}]
				},
			layout{id:148973, width:544.243, height:586.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:153.6, eindx:131.557, eindy:171.6},
					component{type:kop, font:"160 KOP kopstuk 75 pt (R/SPR)", fontsize:0, x:0.0, y:0.0, eindx:544.243, eindy:153.6},
					component{type:inleiding, font:"202 INL kopstuk", fontsize:0, x:0.0, y:153.6, eindx:131.557, eindy:359.20000000000005},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:153.6, eindx:544.243, eindy:586.6}],
				photos:
					[photo{id:5347, x:142.895, y:153.6, eindx:536.243, eindy:412.161, captionx:142.895, captiony:412.161, captioneindx:536.243, captioneindy:429.161}]
				}]
			},
		article{id:14389, type:kopstuk, plaatsing:m, kader:true, layouts:
			[layout{
				id:148977, width:683.139, height:461.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:86.4, eindx:268.053, eindy:104.4},
					component{type:kop, font:"160 KOP kopstuk 75 pt (R/SPR)", fontsize:78, x:0.0, y:0.0, eindx:683.139, eindy:86.4},
					component{type:inleiding, font:"202 INL kopstuk", fontsize:0, x:0.0, y:86.4, eindx:268.053, eindy:202.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:86.4, eindx:683.139, eindy:461.40000000000003}],
				photos:
					[photo{id:5351, x:279.391, y:86.4, eindx:675.139, eindy:355.486, captionx:279.391, captiony:360.286, captioneindx:675.139, captioneindy:382.086}]
				},
			layout{id:148976, width:544.243, height:615.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:153.6, eindx:131.557, eindy:171.6},
					component{type:kop, font:"160 KOP kopstuk 75 pt (R/SPR)", fontsize:0, x:0.0, y:0.0, eindx:544.243, eindy:153.6},
					component{type:inleiding, font:"202 INL kopstuk", fontsize:0, x:0.0, y:153.6, eindx:131.557, eindy:397.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:153.6, eindx:544.243, eindy:615.6}],
				photos:
					[photo{id:5350, x:142.895, y:153.6, eindx:536.243, eindy:422.68600000000004, captionx:142.895, captiony:422.68600000000004, captioneindx:536.243, captioneindy:439.68600000000004}]
				}]
			},
		article{id:16766, type:fotoartikel, plaatsing:v, kader:false, layouts:
			[layout{
				id:148987, width:405.348, height:377.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:20, x:0.0, y:18.0, eindx:405.348, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:405.348, eindy:377.40000000000003}],
				photos:
					[photo{id:5361, x:0.0, y:38.4, eindx:405.348, eindy:259.13100000000003, captionx:0.0, captiony:259.13100000000003, captioneindx:405.348, captioneindy:276.13100000000003}]
				}]
			},
		article{id:14290, type:fotoartikel, plaatsing:m, kader:false, layouts:
			[layout{
				id:148981, width:405.348, height:425.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:425.0}],
				photos:
					[photo{id:5355, x:0.0, y:48.00000000000001, eindx:405.348, eindy:317.95300000000003, captionx:0.0, captiony:317.95300000000003, captioneindx:405.348, captioneindy:334.95300000000003}]
				}]
			},
		article{id:16171, type:fotoartikel, plaatsing:v, kader:false, layouts:
			[layout{
				id:148984, width:405.348, height:291.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:291.0}],
				photos:
					[photo{id:5358, x:138.896, y:48.00000000000001, eindx:405.348, eindy:225.461, captionx:138.896, captiony:225.461, captioneindx:405.348, captioneindy:242.461}]
				},
			layout{id:148985, width:266.452, height:386.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:386.40000000000003}],
				photos:
					[photo{id:5359, x:0.0, y:38.4, eindx:266.452, eindy:215.86100000000002, captionx:0.0, captiony:215.86100000000002, captioneindx:266.452, captioneindy:232.861}]
				},
			layout{id:148986, width:266.452, height:406.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:22, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:406.0}],
				photos:
					[photo{id:5360, x:0.0, y:48.00000000000001, eindx:266.452, eindy:225.461, captionx:0.0, captiony:225.461, captioneindx:266.452, captioneindy:242.461}]
				}]
			},
		article{id:14390, type:fotoartikel, plaatsing:m, kader:false, layouts:
			[layout{
				id:148982, width:266.452, height:309.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:0, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:309.40000000000003}],
				photos:
					[photo{id:5356, x:0.0, y:38.4, eindx:266.452, eindy:216.382, captionx:0.0, captiony:216.382, captioneindx:266.452, captioneindy:233.382}]
				},
			layout{id:148983, width:266.452, height:319.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:16, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:319.40000000000003}],
				photos:
					[photo{id:5357, x:0.0, y:38.4, eindx:266.452, eindy:216.382, captionx:0.0, captiony:216.382, captioneindx:266.452, captioneindy:233.382}]
				}]
			},
		article{id:16771, type:fotoartikel, plaatsing:m, kader:false, layouts:
			[layout{
				id:148988, width:266.452, height:309.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:309.40000000000003}],
				photos:
					[photo{id:5362, x:0.0, y:38.4, eindx:266.452, eindy:216.436, captionx:0.0, captiony:216.436, captioneindx:266.452, captioneindy:233.43600000000004}]
				},
			layout{id:148989, width:266.452, height:329.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:26, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:329.0}],
				photos:
					[photo{id:5363, x:0.0, y:48.00000000000001, eindx:266.452, eindy:226.036, captionx:0.0, captiony:226.036, captioneindx:266.452, captioneindy:243.036}]
				}]
			},
		article{id:17162, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149044, width:405.348, height:367.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:27, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:132.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:367.0}],
				photos:
					[photo{id:5368, x:138.896, y:48.00000000000001, eindx:405.348, eindy:239.199, captionx:138.896, captiony:239.199, captioneindx:405.348, captioneindy:266.199}]
				},
			layout{id:149043, width:405.348, height:367.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:27, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:132.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:367.0}],
				photos:
					[photo{id:5367, x:138.896, y:48.00000000000001, eindx:405.348, eindy:239.199, captionx:138.896, captiony:239.199, captioneindx:405.348, captioneindy:266.199}]
				},
			layout{id:149042, width:405.348, height:367.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:26, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:132.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:367.0}],
				photos:
					[photo{id:5366, x:138.896, y:48.00000000000001, eindx:405.348, eindy:239.199, captionx:138.896, captiony:239.199, captioneindx:405.348, captioneindy:266.199}]
				}]
			},
		article{id:13997, type:normaal, plaatsing:a, kader:false, layouts:
			[layout{
				id:149001, width:266.452, height:492.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:15, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:492.4}],
				photos:
					[photo{id:5365, x:0.0, y:38.4, eindx:266.452, eindy:306.17, captionx:0.0, captiony:306.17, captioneindx:266.452, captioneindy:323.17}]
				},
			layout{id:149000, width:266.452, height:492.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:14, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:492.4}],
				photos:
					[photo{id:5364, x:0.0, y:38.4, eindx:266.452, eindy:306.17, captionx:0.0, captiony:306.17, captioneindx:266.452, captioneindy:323.17}]
				}]
			},
		article{id:45735, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:148999, width:405.348, height:214.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:23, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:132.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:214.0}]
				},
			layout{id:148998, width:405.348, height:214.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:24, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:132.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:214.0}]
				},
			layout{id:148997, width:405.348, height:214.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:23, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:132.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:214.0}]
				},
			layout{id:148996, width:405.348, height:214.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:23, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:132.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:214.0}]
				},
			layout{id:148995, width:405.348, height:214.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:24, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:132.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:214.0}]
				},
			layout{id:148994, width:405.348, height:214.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:23, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:132.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:214.0}]
				},
			layout{id:148991, width:266.452, height:261.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:16, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:74.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:261.40000000000003}]
				},
			layout{id:148990, width:266.452, height:261.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:15, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:74.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:261.40000000000003}]
				},
			layout{id:148993, width:266.452, height:281.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:0, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:113.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:281.40000000000003}]
				},
			layout{id:148992, width:266.452, height:281.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:15, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:113.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:281.40000000000003}]
				}]
			},
		article{id:16524, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149033, width:266.452, height:223.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:17, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:223.40000000000003}]
				},
			layout{id:149032, width:266.452, height:223.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:16, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:223.40000000000003}]
				},
			layout{id:149035, width:266.452, height:242.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:17, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:242.40000000000003}]
				},
			layout{id:149034, width:266.452, height:242.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:16, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:242.40000000000003}]
				},
			layout{id:149041, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:0, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149040, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:0, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149039, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:24, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149038, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:0, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149037, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:0, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149036, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:24, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				}]
			},
		article{id:14021, type:normaal, plaatsing:m, kader:true, layouts:
			[layout{
				id:149003, width:266.452, height:174.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:26.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:16, x:0.0, y:26.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:174.0}]
				},
			layout{id:149002, width:266.452, height:174.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:26.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:15, x:0.0, y:26.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:174.0}]
				},
			layout{id:149005, width:266.452, height:183.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:26.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:0, x:0.0, y:26.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:183.0}]
				},
			layout{id:149004, width:266.452, height:183.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:26.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:15, x:0.0, y:26.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:183.0}]
				},
			layout{id:149011, width:405.348, height:154.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:24, x:0.0, y:26.0, eindx:405.348, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:405.348, eindy:154.6}]
				},
			layout{id:149010, width:405.348, height:154.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:0, x:0.0, y:26.0, eindx:405.348, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:405.348, eindy:154.6}]
				},
			layout{id:149009, width:405.348, height:154.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:24, x:0.0, y:26.0, eindx:405.348, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:405.348, eindy:154.6}]
				},
			layout{id:149008, width:405.348, height:154.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:24, x:0.0, y:26.0, eindx:405.348, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:405.348, eindy:154.6}]
				},
			layout{id:149007, width:405.348, height:154.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:0, x:0.0, y:26.0, eindx:405.348, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:405.348, eindy:154.6}]
				},
			layout{id:149006, width:405.348, height:154.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:24, x:0.0, y:26.0, eindx:405.348, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:405.348, eindy:154.6}]
				}]
			},
		article{id:14414, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149025, width:266.452, height:156.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:156.4}]
				},
			layout{id:149024, width:266.452, height:156.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:20, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:156.4}]
				},
			layout{id:149023, width:266.452, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:21, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:156.0}]
				},
			layout{id:149022, width:266.452, height:146.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:20, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:146.4}]
				},
			layout{id:149031, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				},
			layout{id:149030, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				},
			layout{id:149029, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				},
			layout{id:149028, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				},
			layout{id:149027, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				},
			layout{id:149026, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				}]
			},
		article{id:14157, type:normaal, plaatsing:a, kader:false, layouts:
			[layout{
				id:149015, width:266.452, height:146.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:146.4}]
				},
			layout{id:149014, width:266.452, height:146.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:17, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:146.4}]
				},
			layout{id:149013, width:266.452, height:146.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:146.4}]
				},
			layout{id:149012, width:266.452, height:146.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:17, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:146.4}]
				},
			layout{id:149021, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:27, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				},
			layout{id:149020, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				},
			layout{id:149019, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:26, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				},
			layout{id:149018, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:27, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				},
			layout{id:149017, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				},
			layout{id:149016, width:405.348, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:26, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:127.0}]
				}]
			},
		article{id:45965, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149050, width:405.348, height:204.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:22, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:204.0}]
				},
			layout{id:149049, width:405.348, height:204.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:23, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:204.0}]
				},
			layout{id:149048, width:405.348, height:204.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:22, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:204.0}]
				},
			layout{id:149047, width:405.348, height:204.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:22, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:204.0}]
				},
			layout{id:149046, width:405.348, height:204.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:23, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:204.0}]
				},
			layout{id:149045, width:405.348, height:204.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:22, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:204.0}]
				}]
			},
		article{id:45333, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149054, width:266.452, height:242.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:103.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:242.40000000000003}]
				},
			layout{id:149053, width:266.452, height:252.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:24, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:113.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:252.0}]
				},
			layout{id:149052, width:266.452, height:252.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:0, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:84.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:252.0}]
				},
			layout{id:149051, width:266.452, height:252.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:24, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:84.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:252.0}]
				},
			layout{id:149060, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:113.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149059, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:113.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149058, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:113.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149057, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:113.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149056, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:113.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149055, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:113.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				}]
			},
		article{id:45663, type:normaal, plaatsing:a, kader:false, layouts:
			[layout{
				id:149062, width:266.452, height:204.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:204.4}]
				},
			layout{id:149061, width:266.452, height:204.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:204.4}]
				},
			layout{id:149064, width:266.452, height:213.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:213.4}]
				},
			layout{id:149063, width:266.452, height:213.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:213.4}]
				},
			layout{id:149070, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0}]
				},
			layout{id:149069, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0}]
				},
			layout{id:149068, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0}]
				},
			layout{id:149067, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0}]
				},
			layout{id:149066, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001}]
				},
			layout{id:149065, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0}]
				}]
			},
		article{id:45739, type:normaal, plaatsing:a, kader:false, layouts:
			[layout{
				id:149074, width:266.452, height:137.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:137.4}]
				},
			layout{id:149073, width:266.452, height:137.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:137.4}]
				},
			layout{id:149072, width:266.452, height:137.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:137.4}]
				},
			layout{id:149071, width:266.452, height:137.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:137.4}]
				},
			layout{id:149080, width:405.348, height:118.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:118.0}]
				},
			layout{id:149079, width:405.348, height:118.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:118.0}]
				},
			layout{id:149078, width:405.348, height:118.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:118.0}]
				},
			layout{id:149077, width:405.348, height:118.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:118.0}]
				},
			layout{id:149076, width:405.348, height:118.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:118.0}]
				},
			layout{id:149075, width:405.348, height:118.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:118.0}]
				}]
			},
		article{id:14227, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149166, width:405.348, height:223.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:151.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:223.0}]
				},
			layout{id:149165, width:405.348, height:223.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:151.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:223.0}]
				},
			layout{id:149164, width:405.348, height:223.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:27, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:151.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:223.0}]
				},
			layout{id:149163, width:405.348, height:223.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:151.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:223.0}]
				},
			layout{id:149162, width:405.348, height:223.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:151.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:223.0}]
				},
			layout{id:149161, width:405.348, height:223.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:27, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:inleiding, font:"201 INL 9,6 pt", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:151.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:223.0}]
				}]
			},
		article{id:13993, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149132, width:266.452, height:213.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:20, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:213.4}]
				},
			layout{id:149131, width:266.452, height:213.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:213.4}]
				},
			layout{id:149134, width:266.452, height:233.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:233.40000000000003}]
				},
			layout{id:149133, width:266.452, height:233.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:233.40000000000003}]
				},
			layout{id:149140, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149139, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149138, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149137, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149136, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149135, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				}]
			},
		article{id:13964, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149112, width:266.452, height:204.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:16, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:204.4}]
				},
			layout{id:149111, width:266.452, height:204.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:15, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:204.4}]
				},
			layout{id:149114, width:266.452, height:223.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:0, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:223.40000000000003}]
				},
			layout{id:149113, width:266.452, height:223.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:15, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:223.40000000000003}]
				},
			layout{id:149120, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:24, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149119, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:24, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149118, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:23, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149117, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:24, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149116, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:24, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149115, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:23, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				}]
			},
		article{id:16431, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149178, width:266.452, height:194.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:194.4}]
				},
			layout{id:149177, width:266.452, height:194.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:194.4}]
				},
			layout{id:149180, width:266.452, height:213.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:213.4}]
				},
			layout{id:149179, width:266.452, height:213.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:213.4}]
				},
			layout{id:149186, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0}]
				},
			layout{id:149185, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0}]
				},
			layout{id:149184, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:27, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0}]
				},
			layout{id:149183, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0}]
				},
			layout{id:149182, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0}]
				},
			layout{id:149181, width:405.348, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:27, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:166.0}]
				}]
			},
		article{id:13963, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149102, width:266.452, height:185.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:20, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:185.4}]
				},
			layout{id:149101, width:266.452, height:185.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:185.4}]
				},
			layout{id:149104, width:266.452, height:194.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:194.4}]
				},
			layout{id:149103, width:266.452, height:194.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:194.4}]
				},
			layout{id:149110, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				},
			layout{id:149109, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				},
			layout{id:149108, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				},
			layout{id:149107, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				},
			layout{id:149106, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				},
			layout{id:149105, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				}]
			},
		article{id:13995, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149142, width:266.452, height:175.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:175.4}]
				},
			layout{id:149141, width:266.452, height:175.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:175.4}]
				},
			layout{id:149144, width:266.452, height:185.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:185.4}]
				},
			layout{id:149143, width:266.452, height:185.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:185.4}]
				},
			layout{id:149150, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				},
			layout{id:149149, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				},
			layout{id:149148, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				},
			layout{id:149147, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				},
			layout{id:149146, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				},
			layout{id:149145, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				}]
			},
		article{id:16936, type:normaal, plaatsing:m, kader:true, layouts:
			[layout{
				id:149190, width:266.452, height:155.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:26.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:15, x:0.0, y:26.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:155.0}]
				},
			layout{id:149189, width:266.452, height:155.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:26.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:14, x:0.0, y:26.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:155.0}]
				},
			layout{id:149188, width:266.452, height:145.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:26.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:15, x:0.0, y:26.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:145.0}]
				},
			layout{id:149187, width:266.452, height:145.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:26.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:14, x:0.0, y:26.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:145.0}]
				},
			layout{id:149196, width:405.348, height:135.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:23, x:0.0, y:26.0, eindx:405.348, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:405.348, eindy:135.6}]
				},
			layout{id:149195, width:405.348, height:135.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:23, x:0.0, y:26.0, eindx:405.348, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:405.348, eindy:135.6}]
				},
			layout{id:149193, width:405.348, height:135.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:23, x:0.0, y:26.0, eindx:405.348, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:405.348, eindy:135.6}]
				},
			layout{id:149192, width:405.348, height:135.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:23, x:0.0, y:26.0, eindx:405.348, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:405.348, eindy:135.6}]
				},
			layout{id:149194, width:405.348, height:126.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:22, x:0.0, y:26.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:126.0}]
				},
			layout{id:149191, width:405.348, height:126.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:26.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:22, x:0.0, y:26.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:126.0}]
				}]
			},
		article{id:14022, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149154, width:266.452, height:127.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:17, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:127.4}]
				},
			layout{id:149153, width:266.452, height:127.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:16, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:127.4}]
				},
			layout{id:149152, width:266.452, height:127.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:17, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:127.4}]
				},
			layout{id:149151, width:266.452, height:127.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:16, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:127.4}]
				},
			layout{id:149160, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:0, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149159, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:26, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149158, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:0, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149157, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:0, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149156, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:26, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149155, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:0, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				}]
			},
		article{id:13911, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149083, width:266.452, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:23, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:127.0}]
				},
			layout{id:149082, width:266.452, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:24, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:127.0}]
				},
			layout{id:149081, width:266.452, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:23, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:127.0}]
				},
			layout{id:149084, width:266.452, height:117.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:117.4}]
				},
			layout{id:149090, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149089, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149088, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149087, width:405.348, height:108.0, 
				components:
					[component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0}]
				},
			layout{id:149086, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149085, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				}]
			},
		article{id:16387, type:normaal, plaatsing:a, kader:false, layouts:
			[layout{
				id:149168, width:266.452, height:204.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:204.4}]
				},
			layout{id:149167, width:266.452, height:204.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:204.4}]
				},
			layout{id:149170, width:266.452, height:223.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:223.40000000000003}]
				},
			layout{id:149169, width:266.452, height:223.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:223.40000000000003}]
				},
			layout{id:149176, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149175, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149174, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:27, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149173, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149172, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				},
			layout{id:149171, width:405.348, height:175.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:27, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:175.0}]
				}]
			},
		article{id:13913, type:normaal, plaatsing:a, kader:false, layouts:
			[layout{
				id:149094, width:266.452, height:194.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:194.4}]
				},
			layout{id:149092, width:266.452, height:195.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:23, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:195.0}]
				},
			layout{id:149091, width:266.452, height:195.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:22, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:195.0}]
				},
			layout{id:149093, width:266.452, height:204.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:22, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:204.0}]
				},
			layout{id:149100, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				},
			layout{id:149099, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				},
			layout{id:149098, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				},
			layout{id:149097, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				},
			layout{id:149096, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				},
			layout{id:149095, width:405.348, height:156.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:156.0}]
				}]
			},
		article{id:13973, type:normaal, plaatsing:a, kader:false, layouts:
			[layout{
				id:149124, width:266.452, height:127.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:127.4}]
				},
			layout{id:149123, width:266.452, height:127.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:127.4}]
				},
			layout{id:149122, width:266.452, height:117.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:20, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:117.4}]
				},
			layout{id:149121, width:266.452, height:117.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:117.4}]
				},
			layout{id:149130, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149129, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149128, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149127, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149126, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				},
			layout{id:149125, width:405.348, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:108.0}]
				}]
			},
		article{id:44963, type:normaal, plaatsing:a, kader:false, layouts:
			[layout{
				id:149198, width:266.452, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:22, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:185.0}]
				},
			layout{id:149197, width:266.452, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:21, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:185.0}]
				},
			layout{id:149200, width:266.452, height:185.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:19, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:185.4}]
				},
			layout{id:149199, width:266.452, height:195.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:21, x:0.0, y:18.0, eindx:266.452, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:266.452, eindy:195.0}]
				},
			layout{id:149206, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				},
			layout{id:149205, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				},
			layout{id:149204, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				},
			layout{id:149203, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				},
			layout{id:149202, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				},
			layout{id:149201, width:405.348, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:28, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:147.0}]
				}]
			},
		article{id:14292, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149214, width:266.452, height:233.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:14, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:233.40000000000003}]
				},
			layout{id:149215, width:266.452, height:242.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0},
					component{type:kop, font:"001 KOP kort 16 pt", fontsize:14, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:242.40000000000003}]
				},
			layout{id:149221, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:21, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149220, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:22, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149219, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:21, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149218, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:21, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149217, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:22, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				},
			layout{id:149216, width:405.348, height:185.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:21, x:0.0, y:18.0, eindx:405.348, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:405.348, eindy:185.0}]
				}]
			},
		article{id:14291, type:normaal, plaatsing:m, kader:false, layouts:
			[layout{
				id:149207, width:266.452, height:223.4, 
				components:
					[component{type:kop, font:"001 KOP kort 16 pt", fontsize:12, x:0.0, y:18.0, eindx:266.452, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:266.452, eindy:223.40000000000003},
					component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:266.452, eindy:18.0}]
				},
			layout{id:149213, width:405.348, height:165.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:18, x:0.0, y:18.0, eindx:405.348, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:405.348, eindy:165.4}]
				},
			layout{id:149212, width:405.348, height:165.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:19, x:0.0, y:18.0, eindx:405.348, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:405.348, eindy:165.4}]
				},
			layout{id:149211, width:405.348, height:165.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:405.348, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:405.348, eindy:165.4}]
				},
			layout{id:149210, width:405.348, height:165.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"005 KOP 25 pt regular", fontsize:18, x:0.0, y:18.0, eindx:405.348, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:405.348, eindy:165.4}]
				},
			layout{id:149209, width:405.348, height:165.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"004 KOP 25 pt light", fontsize:19, x:0.0, y:18.0, eindx:405.348, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:405.348, eindy:165.4}]
				},
			layout{id:149208, width:405.348, height:165.4, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:405.348, eindy:18.0},
					component{type:kop, font:"006 KOP 25 pt bold", fontsize:18, x:0.0, y:18.0, eindx:405.348, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:405.348, eindy:165.4}]
				}]
			},
		article{id:44959, type:kortje, plaatsing:v, kader:false, layouts:
			[layout{
				id:149223, width:127.557, height:184.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:184.6}]
				}]
			},
		article{id:45959, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149222, width:127.557, height:184.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:184.6}]
				}]
			},
		article{id:45658, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149224, width:127.557, height:98.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:98.4}]
				},
			layout{id:149225, width:127.557, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:108.0}]
				}]
			},
		article{id:45661, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149226, width:127.557, height:98.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:98.4}]
				},
			layout{id:149227, width:127.557, height:117.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:117.6}]
				}]
			},
		article{id:16066, type:kortje, plaatsing:m, kader:true, layouts:
			[layout{
				id:149257, width:127.557, height:212.2, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:26.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:26.0, eindx:127.557, eindy:67.19999999999999},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:67.19999999999999, eindx:127.557, eindy:212.20000000000002}]
				}]
			},
		article{id:16495, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149258, width:127.557, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:166.0}]
				}]
			},
		article{id:14287, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149245, width:127.557, height:166.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:166.0}]
				}]
			},
		article{id:16047, type:kortje, plaatsing:m, kader:true, layouts:
			[layout{
				id:149248, width:127.557, height:192.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:26.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:26.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:192.6}]
				}]
			},
		article{id:16519, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149263, width:127.557, height:137.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:137.4}]
				},
			layout{id:149264, width:127.557, height:147.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:147.0}]
				}]
			},
		article{id:14282, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149236, width:127.557, height:127.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:127.4}]
				}]
			},
		article{id:16761, type:kortje, plaatsing:m, kader:true, layouts:
			[layout{
				id:149271, width:127.557, height:155.0, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:23.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:23.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:155.0}]
				},
			layout{id:149272, width:127.557, height:174.2, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:26.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:26.0, eindx:127.557, eindy:67.19999999999999},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:67.19999999999999, eindx:127.557, eindy:174.20000000000002}]
				}]
			},
		article{id:14020, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149228, width:127.557, height:117.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:117.4}]
				},
			layout{id:149229, width:127.557, height:136.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:136.6}]
				}]
			},
		article{id:16497, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149259, width:127.557, height:127.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:127.4}]
				},
			layout{id:149260, width:127.557, height:137.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:137.0}]
				}]
			},
		article{id:16498, type:kortje, plaatsing:m, kader:true, layouts:
			[layout{
				id:149261, width:127.557, height:154.6, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:23.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:23.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:154.6}]
				},
			layout{id:149262, width:127.557, height:164.2, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:26.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:26.0, eindx:127.557, eindy:67.19999999999999},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:67.19999999999999, eindx:127.557, eindy:164.20000000000002}]
				}]
			},
		article{id:14286, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149243, width:127.557, height:117.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:117.4}]
				},
			layout{id:149244, width:127.557, height:136.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:136.6}]
				}]
			},
		article{id:14392, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149246, width:127.557, height:117.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:117.4}]
				},
			layout{id:149247, width:127.557, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:127.0}]
				}]
			},
		article{id:16050, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149253, width:127.557, height:117.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:117.4}]
				},
			layout{id:149254, width:127.557, height:127.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:127.0}]
				}]
			},
		article{id:16760, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149269, width:127.557, height:117.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:117.4}]
				},
			layout{id:149270, width:127.557, height:136.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:136.6}]
				}]
			},
		article{id:16934, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149283, width:127.557, height:108.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:108.4}]
				},
			layout{id:149284, width:127.557, height:118.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:118.0}]
				}]
			},
		article{id:16520, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149265, width:127.557, height:108.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:108.4}]
				},
			layout{id:149266, width:127.557, height:127.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:127.6}]
				}]
			},
		article{id:14280, type:kortje, plaatsing:m, kader:true, layouts:
			[layout{
				id:149232, width:127.557, height:126.0, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:23.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:23.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:126.0}]
				},
			layout{id:149233, width:127.557, height:135.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:26.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:26.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:135.6}]
				}]
			},
		article{id:16048, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149249, width:127.557, height:108.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:108.4}]
				},
			layout{id:149250, width:127.557, height:127.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:127.6}]
				}]
			},
		article{id:16764, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149277, width:127.557, height:98.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:98.4}]
				},
			layout{id:149278, width:127.557, height:117.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:117.6}]
				}]
			},
		article{id:14279, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149230, width:127.557, height:98.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:98.4}]
				},
			layout{id:149231, width:127.557, height:108.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:108.0}]
				}]
			},
		article{id:14283, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149237, width:127.557, height:89.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:89.4}]
				},
			layout{id:149238, width:127.557, height:99.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:99.0}]
				}]
			},
		article{id:16762, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149273, width:127.557, height:98.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:98.4}]
				},
			layout{id:149274, width:127.557, height:117.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:117.6}]
				}]
			},
		article{id:14281, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149234, width:127.557, height:89.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:89.4}]
				},
			layout{id:149235, width:127.557, height:108.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:108.6}]
				}]
			},
		article{id:16521, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149267, width:127.557, height:89.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:89.4}]
				},
			layout{id:149268, width:127.557, height:108.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:108.6}]
				}]
			},
		article{id:16769, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149281, width:127.557, height:89.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:89.4}]
				},
			layout{id:149282, width:127.557, height:108.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:108.6}]
				}]
			},
		article{id:16049, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149251, width:127.557, height:89.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:89.4}]
				},
			layout{id:149252, width:127.557, height:99.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:99.0}]
				}]
			},
		article{id:16065, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149255, width:127.557, height:89.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:89.4}]
				},
			layout{id:149256, width:127.557, height:99.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:99.0}]
				}]
			},
		article{id:16765, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149279, width:127.557, height:89.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:89.4}]
				},
			layout{id:149280, width:127.557, height:99.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:99.0}]
				}]
			},
		article{id:14285, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149241, width:127.557, height:89.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:89.4}]
				},
			layout{id:149242, width:127.557, height:108.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:108.6}]
				}]
			},
		article{id:14284, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149240, width:127.557, height:89.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:89.0}]
				},
			layout{id:149239, width:127.557, height:79.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:79.4}]
				}]
			},
		article{id:16763, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149276, width:127.557, height:89.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:89.0}]
				},
			layout{id:149275, width:127.557, height:79.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:79.4}]
				}]
			},
		article{id:46232, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149285, width:127.557, height:127.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:127.4}]
				},
			layout{id:149286, width:127.557, height:137.0, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:48.00000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:48.00000000000001, eindx:127.557, eindy:137.0}]
				}]
			},
		article{id:45659, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149288, width:127.557, height:98.4, 
				components:
					[component{type:gemeente, font:"663 Plaatsnaam klein (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:15.0},
					component{type:kop, font:"163 KOP klein (R)", fontsize:0, x:0.0, y:15.0, eindx:127.557, eindy:38.4},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:38.4, eindx:127.557, eindy:98.4}]
				},
			layout{id:149289, width:127.557, height:117.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:117.6}]
				}]
			},
		article{id:45428, type:kortje, plaatsing:a, kader:false, layouts:
			[layout{
				id:149287, width:127.557, height:156.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:156.6}]
				}]
			},
		article{id:16053, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149290, width:127.557, height:175.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:175.6}]
				}]
			},
		article{id:16173, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149291, width:127.557, height:156.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:156.6}]
				}]
			},
		article{id:16937, type:kortje, plaatsing:a, kader:false, layouts:
			[layout{
				id:149292, width:127.557, height:156.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:156.6}]
				}]
			},
		article{id:45742, type:kortje, plaatsing:m, kader:false, layouts:
			[layout{
				id:149295, width:127.557, height:165.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:165.6}]
				}]
			},
		article{id:46058, type:kortje, plaatsing:a, kader:false, layouts:
			[layout{
				id:149293, width:127.557, height:184.6, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:57.6},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:57.6, eindx:127.557, eindy:184.6}]
				}]
			},
		article{id:44958, type:kortje, plaatsing:a, kader:false, layouts:
			[layout{
				id:149294, width:127.557, height:194.8, 
				components:
					[component{type:gemeente, font:"662 Plaatsnaam (R)", fontsize:0, x:0.0, y:0.0, eindx:127.557, eindy:18.0},
					component{type:kop, font:"162 KOP Kolom (R)", fontsize:0, x:0.0, y:18.0, eindx:127.557, eindy:76.80000000000001},
					component{type:tekst, font:"301 TEK mager", fontsize:0, x:0.0, y:76.80000000000001, eindx:127.557, eindy:194.8}]
				}]
			}
		].