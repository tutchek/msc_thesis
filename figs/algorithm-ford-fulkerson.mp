prologues:=3;
verbatimtex 
\input cs-pagella 
\setmathfamily \bffam \tenbf
\setmathfamily \bifam \tenbi
etex

input boxes;

u = 1.5mm;
v = 2u;
w = 10cm;
b = 1cm;
a = .3;

beginfig(1)

	pair s; pair t; pair so[]; pair sd[];

	s = origin;
	t = s + (dir 0) * w;

	for i=1 upto 2:
		so[i] = s + (dir 0) * a * w + (dir 90) * i * b;
		sd[i] = t + (dir 180) * a * w + (dir 90) * i * b;

		so[i+2] = s + (dir 0) * a * w - (dir 90) * i * b;
		sd[i+2] = t + (dir 180) * a * w - (dir 90) * i * b;
	endfor;
	so[5] = s + (dir 0) * a * w;
	sd[5] = t + (dir 180) * a * w;

	pickup pencircle scaled 1.5mm;

	draw s; draw t; 

	for i=1 upto 5:
		draw so[i];
		draw sd[i];
	endfor

	pickup defaultpen;

	for i=1 upto 5:
		draw s--so[i];
		draw sd[i]--t;

		for j=1 upto 5:
			draw so[i]--sd[j];
		endfor;
	endfor;

	label.top(btex $\infty$ etex, .5[so[2],sd[2]]);

	label.top(btex $s_1$ etex, so[2]);
	label.top(btex $s_2$ etex, so[1]);
	label.top(btex $s_3$ etex, so[5]);
	label.bot(btex $s_4$ etex, so[3]);
	label.bot(btex $s_5$ etex, so[4]);

	label.top(btex $s_1$ etex, sd[2]);
	label.top(btex $s_2$ etex, sd[1]);
	label.top(btex $s_3$ etex, sd[5]);
	label.bot(btex $s_4$ etex, sd[3]);
	label.bot(btex $s_5$ etex, sd[4]);

	label.lft(btex ${\bf 0}$ etex, s);
	label.rt(btex ${\bf 1}$ etex, t);


	z11 = whatever[s,so[2]];
	z12 = whatever[s,so[1]];
	z13 = whatever[s,so[5]];
	z14 = whatever[s,so[3]];
	z15 = whatever[s,so[4]];

	xpart(z11) = xpart(z12) = xpart(z13) = xpart(z14) = xpart(z15);

	z13 = .6[s,so[5]];

	label.top(btex $a_1$ etex, z11);
	label.top(btex $a_2$ etex, z12);
	label.top(btex $a_3$ etex,  z13);
	label.bot(btex $a_4$ etex, z14);
	label.bot(btex $a_5$ etex, z15);

	z21 = whatever[t,sd[2]];
	z22 = whatever[t,sd[1]];
	z23 = whatever[t,sd[5]];
	z24 = whatever[t,sd[3]];
	z25 = whatever[t,sd[4]];

	xpart(z21) = xpart(z22) = xpart(z23) = xpart(z24) = xpart(z25);

	z23 = .6[t, sd[5]];

	label.top(btex $d_1$ etex, z21);
	label.top(btex $d_2$ etex, z22);
	label.top(btex $d_3$ etex,  z23);
	label.bot(btex $d_4$ etex, z24);
	label.bot(btex $d_5$ etex, z25);

	path p[];

	p1 = (so[2]+(dir 180)*.5cm){up}..{down}(so[2]+(dir 0)*.5cm)--(so[4]+(dir 0)*.5cm){down}..{up}(so[4]+(dir 180)*.5cm)--cycle;
	p2 = (sd[2]+(dir 180)*.5cm){up}..{down}(sd[2]+(dir 0)*.5cm)--(sd[4]+(dir 0)*.5cm){down}..{up}(sd[4]+(dir 180)*.5cm)--cycle;


	draw p1 dashed evenly;	
	draw p2 dashed evenly;	

	label.ulft(btex $S$ etex, so[2]+(dir 180)*.5cm);
	label.urt(btex $D$ etex, sd[2]+(dir 0)*.5cm);

	pickup pencircle scaled .5mm;
	drawarrow s--so[1]--sd[4]--.95[sd[4],t];

endfig;
bye;
