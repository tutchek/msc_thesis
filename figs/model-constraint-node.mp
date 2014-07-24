prologues:=3;
verbatimtex \input common etex

beginfig(1)
	u=2cm;

	z1 = origin; z2 = z1 + .5u * dir 60; z3 = z2 + .5u * dir 0; z4 = z1 + u * dir 0;
	
	pickup pencircle scaled 1mm;
	draw z1; draw z2; draw z3; draw z4;

	pickup defaultpen;
	drawarrow z1--z2; drawarrow z2--z3; drawarrow z3--z4;
	drawarrow z4--z1 dashed evenly;

	label.lft(btex $orig(d)$ etex, z1);
	label.rt(btex dest(d) etex, z4);
endfig;
bye;
