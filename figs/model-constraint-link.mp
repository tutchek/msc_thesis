prologues:=3;
verbatimtex \input cs-pagella etex

u = 1cm;


beginfig(1);


	z0 = origin;
	z1 = u * dir 340; z2 = u * dir 275; z3 = u * dir 200; z4 = u * dir 120; z5 = u * dir 75;

	pickup pencircle scaled 1mm;
	draw z0;

	pickup defaultpen;
	draw z0--z1; draw z0--z2; draw z0--z3; draw z0--z4; draw z0--z5;

	pickup pencircle scaled 0.3mm;
	drawarrow z0--z1;

	label.bot(btex Origin node etex, z2);

endfig;

beginfig(2);


	z0 = origin;
	z1 = u * dir 340; z2 = u * dir 275; z3 = u * dir 200; z4 = u * dir 120; z5 = u * dir 75;

	pickup pencircle scaled 1mm;
	draw z0;

	pickup defaultpen;
	draw z0--z1; draw z0--z2; draw z0--z3; draw z0--z4; draw z0--z5;

	pickup pencircle scaled 0.3mm;
	drawarrow z4--z0;
	drawarrow z0--z2;

	label.bot(btex Node on the path etex, z2);

endfig;

beginfig(3);


	z0 = origin;
	z1 = u * dir 340; z2 = u * dir 275; z3 = u * dir 200; z4 = u * dir 120; z5 = u * dir 75;

	pickup pencircle scaled 1mm;
	draw z0;

	pickup defaultpen;
	draw z0--z1; draw z0--z2; draw z0--z3; draw z0--z4; draw z0--z5;

	pickup pencircle scaled 0.3mm;
	drawarrow z3--z0;

	label.bot(btex Destination node etex, z2);

endfig;

bye;
