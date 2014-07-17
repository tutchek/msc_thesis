prologues:=3;
verbatimtex \input cs-pagella etex


beginfig(1)
	u  = 2cm;
	z1 = origin;
	z1-z2 = u * dir 240; 
	z1-z3 = u * dir 120; 
	z1-z4 = u * dir 0;

	pickup pencircle scaled 1mm;
	draw z1; draw z2; draw z3; draw z4;

	pickup defaultpen;
	label.rt(btex HQ (Praha) etex, z1 + 2mm * dir 0);
	label.rt(btex Praha etex, z2);
	label.bot(btex Brno etex, z3);
	label.bot(btex Plze\v{n} etex, z4);

	% drawarrow z1{}..z2;
	drawdblarrow .1(z2-z1) .. .9(z2-z1) dashed evenly;

	drawdblarrow .1(z3-z1) .. .9(z3-z1);

	drawdblarrow .1(z4-z1) .. .9(z4-z1);
endfig;

bye;
