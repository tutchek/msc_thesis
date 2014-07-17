prologues:=3;
verbatimtex \input cs-pagella etex

input boxes;

u  = 2cm;

vardef orizni(suffix a,b) expr p =
	p cutbefore bpath.a cutafter bpath.b
enddef;

vardef spoj(suffix a,b) =
	orizni(a,b) a.c--b.c
enddef;

vardef oblacesta(suffix a,b) =
	orizni(a, b) a.c{dir (angle (b.c - a.c) - 15)} .. b.c
enddef;

vardef stredoblecesty(suffix a,b) =
	point .5 of oblacesta(a,b)
enddef;

def oboustranne(suffix a,b) text t =
	drawarrow oblacesta(a,b) t;
	drawarrow oblacesta(b,a) t;
enddef;

beginfig(1)


	circleit.gro(btex G etex);
	circleit.kov(btex K etex);	
	circleit.esh(btex E etex);	
	circleit.brn(btex B etex);	
	circleit.plz(btex P etex);	
	circleit.cen(btex C etex);	


	pickup defaultpen;

	esh.c = origin;
	cen.c = esh.c + (dir 240) * .5u;
	kov.c = esh.c + (dir 300) * .5u;

	brn.c = esh.c + (dir 0) * 3u;
	gro.c = esh.c + (dir 90) * 2u;
	plz.c = esh.c + (dir 180) * 3u;
	
	drawboxed(cen, esh, kov, gro, plz, brn);


	drawarrow spoj(cen, esh) dashed evenly;
	drawarrow spoj(cen, kov) dashed evenly;

	oboustranne(esh,gro);
	oboustranne(esh,plz);
	oboustranne(esh,brn);
	oboustranne(esh,kov) dashed evenly;

	pair ccirc, A,B,C, M, cA, cB, D, E;
	A = cen.c;
	B = kov.c;
	C = esh.c;
	M = ccirc;
	cA = .5[B,C]; cB = .5[A,C];

	D = cB + (dir (angle(cB - C) + 90));
	E = cA + (dir (angle(cA - C) + 90));

	M = whatever[cA,E] = whatever[cB, D];
	
	path circ; circ = fullcircle scaled (2 abs(A-M) + 1cm) shifted M; 

	draw circ dashed evenly;

	verbatimtex \def\stk#1#2{$\displaystyle{\matrix{\hbox{\rm #1}\cr\hbox{\rm #2}\cr}}$} etex

	label.bot(btex \stk{s = mon--fri, 9:00--18:00}{d = instant} etex, point 6 of circ);

	label.top(btex \stk{s = mon--fri, 12:00}{d = +1 day, 11:00} etex, stredoblecesty(brn, esh));
	label.bot(btex \stk{s = mon--fri, 17:00}{d = +1 day, 11:13} etex, stredoblecesty(esh, brn));

	label.top(btex \stk{s = mon--fri, 17:00}{d = +1 day, 11:00} etex, stredoblecesty(esh, plz));
	label.bot(btex \stk{s = mon--fri, 8:00}{d = +1 day, 11:00} etex, stredoblecesty(plz, esh));

	label.ulft(btex \stk{s = mon--fri, 14:00}{d = same day, 17:00} etex, stredoblecesty(gro, esh));
	label.urt(btex \stk{s = mon--fri, 15:00}{d = same day, 18:00} etex, stredoblecesty(esh, gro));

endfig;

bye;
