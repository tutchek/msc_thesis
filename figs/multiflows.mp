prologues:=3;
verbatimtex \input cs-pagella etex

beginfig(1)
	u = 3cm;

	z1 = origin;
	z2 = (.3u, .3u); z3 = (.3u, -.3u);
	z4 = (1.2u, .3u); z5 = (1.2u, -.3u);
	z6 = (1.5u, 0);


	pickup defaultpen;
	draw z1--z2; draw z1--z3;
	draw z2--z3;
	draw z2--z5;
	draw z2--z4;
	draw z3--z5;
	draw z4--z5;
	draw z4--z6;
	draw z5--z6;

	
	pickup pencircle scaled .5mm;
	drawarrow z4--(x5,y5+.7mm)--(x2,y2+.7mm)--.9[z2,z3] dashed withdots;
	drawarrow z1--z2--z5--.9[z5,z6] dashed evenly;

	pickup pencircle scaled 2mm;
	for i = 1 upto 6:
		draw z[i];
	endfor

	label.ulft(btex $c_1$ etex, .5[z1,z2]);
	label.llft(btex $c_2$ etex, .5[z1,z3]);
	label.rt(btex $c_3$ etex, .7[z2,z3]);
	label.top(btex $c_4$ etex, .5[z2,z4]);
	label.urt(btex $c_5$ etex, .5[z2,z5]);
	label.bot(btex $c_6$ etex, .5[z3,z5]);
	label.lft(btex $c_7$ etex, .3[z4,z5]);
	label.urt(btex $c_8$ etex, .5[z4,z6]);
	label.lrt(btex $c_9$ etex, .5[z5,z6]);

	label.urt(btex $s_1$ etex, z4);
	label.llft(btex $t_1$ etex, z3);

	label.lft(btex $s_2$ etex, z1);
	label.rt(btex $t_2$ etex, z6);

endfig

bye
