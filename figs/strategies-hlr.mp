prologues:=3;
verbatimtex \input cs-pagella etex

input boxes;

u = 1.5mm;
v = 2u;

beginfig(1)

	verbatimtex \def\stk#1#2{$\displaystyle{\matrix{#1\cr#2\cr}}$} etex

	picture t; t = btex $CS \wedge \neg D$ etex;

	%boxjoin( xpart(a.e - a.w) = xpart(b.e - b.w) = xpart(urcorner t - ulcorner t) + 2u; );
	boxit.a(btex $P_\lambda$ etex);
	boxit.aa(btex $CS$ etex);
	a.dx = a.dy = aa.dy = 2u;
	a.se = aa.ne;
	a.sw = aa.nw;

	boxit.b(btex $P_\lambda \wedge D$ etex);
	boxit.bb(btex $CS \wedge D$ etex);
	b.dx = b.dy = bb.dy = 2u;
	b.se = bb.ne;
	b.sw = bb.nw;

	boxit.c(btex $P_\lambda \wedge \neg D$ etex);
	boxit.cc(btex $CS \wedge \neg D$ etex);
	c.dx = c.dy = cc.dy = 2u;
	c.se = cc.ne;
	c.sw = cc.nw;

	boxit.d(btex \stk{LR}{optimization} etex);


	ypart(c.n) = ypart(b.n) = ypart(aa.s) - 4v;
	xpart(a.s - b.e) = xpart(c.w - a.s) = 2v;
	

	ypart(z1) = ypart(z2) = ypart(bb.s) - 4v;
	xpart(b.s - z1) = xpart(z2 - b.s) = 2v;

	ypart(z3) = ypart(z4) = ypart(cc.s) - 4v;
	xpart(c.s - z3) = xpart(z4 - c.s) = 2v;

	z5 = (0,1)*2v + a.n;

	d.w = .5[a.ne, aa.se] + (1,0) * 15v;

	ypart(d.n - d.s) = ypart(a.ne - aa.se);
	


	pickup defaultpen;
	drawboxed(a, aa, b, bb, c, cc, d);

	drawarrow aa.s--b.n;
	drawarrow aa.s--c.n;

	drawarrow bb.s--z1 dashed evenly;
	drawarrow bb.s--z2 dashed evenly;

	drawarrow cc.s--z3 dashed evenly;
	drawarrow cc.s--z4 dashed evenly;

	drawarrow z5--a.n dashed evenly;

	path p[];
	p1 = a.ne{dir 15}..d.nw;
	p2 = d.sw{dir 195}..aa.se;

	drawarrow p1;
	drawarrow p2;

	label.top(btex $P_\lambda$ etex, point .5 of p1);
	label.bot(btex LR solution etex, point .5 of p2);

	label.lrt(btex $D$ etex, .5[aa.s, b.n]);
	label.llft(btex $\neg D$ etex, .5[aa.s, c.n]);

	z10 = .5[aa.e, aa.ne];
	z11 = .5[aa.e, aa.se];
	
	z12 = .5[d.w, d.nw] + (0, ypart(z10 - aa.e));
	z13 = .5[d.w,d.nw] + (0, -ypart(z10 - aa.e));

	p3 = z10{z10-z12}..{z13-z11}z11--z13{z13-z11}..{z10-z12}z12--cycle;

	drawarrow subpath(0,2) of p3 dashed evenly;
	drawarrow subpath(2,4) of p3 dashed evenly;

	label.top(btex new constraints etex rotated angle(z12-z10), point 3.5 of p3 + (0,-1) * 2mm);
	label.bot(btex new fixed variables etex rotated angle(z13-z11), point 1.5 of p3 + (0,1) * 2mm);

endfig;

bye;
