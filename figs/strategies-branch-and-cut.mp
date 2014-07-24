prologues:=3;
verbatimtex \input common etex

input boxes;

u = 1.5mm;
d = 10*u;
pos =.2;
color seda;
seda = 0.8white;

beginfig(1);

	z0 = origin; z10 = (1,0) * d;
	z20 = (2,0) * d;
	z30 = (3,0) * d;
	z40 = (4,0) * d;
	
	z11 = (0,1) * d;
	z21 = (0,2) * d;
	z31 = (0,3) * d;
	z41 = (0,4) * d;
	z51 = (0,4.5) * d;

	z91 = (0, 11) * d;
	z92 = (11/3, 0) * d;

	z93 = (0, 5/2) * d;
	z94 = (-5, 0) * d;

	z95 = (0, -5);
	z96 = (-6, 0);

	a := angle(z95-z96);

	z99 = whatever [z91,z92] = whatever [z93,z94];

	z100 = z99 + (dir a) * d;
	z101 = z99 -(dir a) * d;

	fill z0--z92--z99--z93--cycle withcolor seda;

	pickup pencircle scaled 1mm;
	draw z0; draw z10; draw z20; draw z30;
	draw z11; draw z21;

	for i=1 upto 3:
		draw (1,i) * d;
		draw (2,i) * d;
	endfor;
	for i=1 upto 2:
		draw (3,i) * d;
	endfor;

	pickup defaultpen;
	drawarrow z0--z40;
	drawarrow z0--z51;
	
	draw z92--z99;
	draw z93--z99;

	draw z100--z101;
	drawarrow pos[z100,z101]--(pos[z100,z101] + (dir (a + 90)) * .3d);
	drawarrow (1-pos)[z100,z101]--((1-pos)[z100,z101] + (dir (a + 90)) * .3d);

	draw z21--(z10 + z31)--(z20+z31)--(z30+z21)--z30 dashed evenly;


	label.llft(btex $0$ etex, z0);
	label.llft(btex $x_1$ etex, z40);
	label.llft(btex $x_2$ etex, z51);
	
	label.bot(btex 1 etex, z10);
	label.bot(btex 2 etex, z20);
	label.bot(btex 3 etex, z30);

	label.lft(btex 1 etex, z11);
	label.lft(btex 2 etex, z21);
	label.lft(btex 3 etex, z31);
	label.lft(btex 4 etex, z41);

endfig;

beginfig(2);
	verbatimtex \def\stk#1#2#3{$\displaystyle{\matrix{#1\cr#2\cr#3\cr}}$} etex
	verbatimtex \def\mathbox #1{{\mathchoice{\mB\textfont{#1}}{\mB\textfont{#1}}
	 {\mB\scriptfont{#1}}{\mB\scriptscriptfont{#1}}}}
	 \def\mB #1#2{\hbox{\ifnum\fam<0 \fam=0 \fi \the#1\fam #2}} etex


	boxjoin(
		% a.dx = a.dy = 2mm; 
		(a.ne-a.se) = (b.ne-b.se)
	);
	boxit.a(btex \stk{\mathbox{Problem (1)}}{\mathbox{Solution to relaxation:}}{(2{3\over 7},3{5\over7}),z=-33{1\over7}} etex);
	boxit.b(btex \stk{\mathbox{Problem (2)}}{\mathbox{Solution to relaxation:}}{(3,2),z=-28} etex);
	boxit.c(btex \stk{\mathbox{Problem (3)}}{\mathbox{Solution to relaxation:}}{(2,3.5),z=-29.5} etex);
	boxit.d(btex \stk{\mathbox{Problem (4)}}{\mathbox{Solution to relaxation:}}{(1.8,3.4),z=-27.8} etex);

	a.c = origin;
	ypart(b.n) = ypart(a.s + (0,-1) * d);
	ypart(c.n) = ypart(a.s + (1,-1) * d);
	-xpart(b.e) = xpart(c.w) = xpart((.2,0) * d);
	d.n = c.s + (0,-1) * d;

	pickup defaultpen;

	drawboxed(a,b,c,d);

	draw a.s--b.n;
	draw a.s--c.n;
	draw c.s--d.n;

	label.rt(btex Add cut: $2x_1 + x_2 \leq 7$ etex, .5[c.s,d.n]);
	label.ulft(btex $x_1 \geq 3$ etex, .5[a.s,b.n]);
	label.urt(btex $x_1 \leq 2$ etex, .5[a.s,c.n]);
	label.ulft(btex Branch on $x_1$: etex, .5[a.s,b.n] + (dir 180) * d);
endfig;

u := 1mm;
d := 10*u;

beginfig(3);

	transform t[];
	t1 = identity shifted ((6,0)*d);
	t2 = identity shifted ((11,0)*d);

	z0 = origin; z10 = (1,0) * d;
	z20 = (2,0) * d;
	z30 = (3,0) * d;
	z40 = (4,0) * d;
	
	z11 = (0,1) * d;
	z21 = (0,2) * d;
	z31 = (0,3) * d;
	z41 = (0,4) * d;
	z51 = (0,4.5) * d;

	z91 = (0, 11) * d;
	z92 = (11/3, 0) * d;

	z93 = (0, 5/2) * d;
	z94 = (-5, 0) * d;

	z95 = (0, -5);
	z96 = (-6, 0);

	a := angle(z95-z96);

	z99 = whatever [z91,z92] = whatever [z93,z94];

	z999 = whatever [z20,z20+z31] = whatever [z93,z94];


	z81 = (3.5,0)*d;
	z82 = (0,7)*d;
	z200 = whatever [z81,z82] = whatever[z93,z94];
	z201 = whatever [z81,z82] = whatever[z30,z30+z21];

	z100 = (z30+z21) + (dir a) * d;
	z101 = (z30+z21) - (dir a) * d;

	z102 = z999 + (dir a) * d;
	z103 = z999 - (dir a) * d;

	z104 = z200 + (dir a) * d;
	z105 = z200 - (dir a) * d;

	fill z30--(z30+z21)--z92--cycle withcolor seda;
	fill z0--z93--z999--z20--cycle transformed t1 withcolor seda;
	fill z0--z93--z200--(z20 + z31)--z20--cycle transformed t2 withcolor seda;

	pickup pencircle scaled 1mm;
	draw z30;

	draw z0 transformed t1; draw z10 transformed t1; draw z20 transformed t1;
	draw z11 transformed t1; draw z21 transformed t1;

	for i=1 upto 3:
		draw (1,i) * d transformed t1;
		draw (2,i) * d transformed t1;

		draw (1,i) * d transformed t2;
		draw (2,i) * d transformed t2;
	endfor;
	for i=1 upto 2:
		draw (3,i) * d;
	endfor;

	pickup defaultpen;
	drawarrow z0--z40;
	drawarrow (z0--z40) transformed t1;
	drawarrow (z0--z40) transformed t2;

	drawarrow z0--z51;
	drawarrow (z0--z51) transformed t1;
	drawarrow (z0--z51) transformed t2;
	
	draw z92--(z30+z21);

	draw z100--z101;
	drawarrow pos[z100,z101]--(pos[z100,z101] + (dir (a + 90)) * .3d);
	drawarrow (1-pos)[z100,z101]--((1-pos)[z100,z101] + (dir (a + 90)) * .3d);

	draw (z102--z103) transformed t1;
	drawarrow (pos[z102,z103]--(pos[z102,z103] + (dir (a + 90)) * .3d)) transformed t1;
	drawarrow ((1-pos)[z102,z103]--((1-pos)[z102,z103] + (dir (a + 90)) * .3d)) transformed t1;

	draw (z104--z105) transformed t2;
	drawarrow (pos[z104,z105]--(pos[z104,z105] + (dir (a + 90)) * .3d)) transformed t2;
	drawarrow ((1-pos)[z104,z105]--((1-pos)[z104,z105] + (dir (a + 90)) * .3d)) transformed t2;

	draw (z30+z21)--z30 dashed evenly;
	draw (z21--(z10 + z31)--(z20+z31)--z20) transformed t1 dashed evenly;
	draw (z21--(z10 + z31)--(z20+z31)--z20) transformed t2 dashed evenly;

	pickup pencircle scaled .5mm;

	draw (z200--(z20 + z31)) transformed t2;

	label.llft(btex $0$ etex, z0);
	label.llft(btex $x_1$ etex, z40);
	label.llft(btex $x_2$ etex, z51);
	
	label.bot(btex 1 etex, z10);
	label.bot(btex 2 etex, z20);
	label.bot(btex 3 etex, z30);

	label.lft(btex 1 etex, z11);
	label.lft(btex 2 etex, z21);
	label.lft(btex 3 etex, z31);
	label.lft(btex 4 etex, z41);

	label.llft(btex $0$ etex, z0 transformed t1);
	label.llft(btex $x_1$ etex, z40 transformed t1);
	label.llft(btex $x_2$ etex, z51 transformed t1);
	
	label.bot(btex 1 etex, z10 transformed t1);
	label.bot(btex 2 etex, z20 transformed t1);
	label.bot(btex 3 etex, z30 transformed t1);

	label.lft(btex 1 etex, z11 transformed t1);
	label.lft(btex 2 etex, z21 transformed t1);
	label.lft(btex 3 etex, z31 transformed t1);
	label.lft(btex 4 etex, z41 transformed t1);

	label.llft(btex $0$ etex, z0 transformed t2);
	label.llft(btex $x_1$ etex, z40 transformed t2);
	label.llft(btex $x_2$ etex, z51 transformed t2);
	
	label.bot(btex 1 etex, z10 transformed t2);
	label.bot(btex 2 etex, z20 transformed t2);
	label.bot(btex 3 etex, z30 transformed t2);

	label.lft(btex 1 etex, z11 transformed t2);
	label.lft(btex 2 etex, z21 transformed t2);
	label.lft(btex 3 etex, z31 transformed t2);
	label.lft(btex 4 etex, z41 transformed t2);

	verbatimtex \def\stk#1#2{$\displaystyle{\matrix{#1\cr#2\cr}}$} etex

	label.urt(btex $x_1 \geq 3$ etex, z10 + z11);
	label.urt(btex $x_1 \leq 2$ etex, (z20 + z11) transformed t1);
	label.urt(btex \stk{x_1 \leq 2}{2x_1+x_2\leq 7} etex, (z20 + z11) transformed t2);
endfig;

bye;
