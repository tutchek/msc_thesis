prologues:=3;
verbatimtex \input cs-pagella etex

input boxes;

u = 1.5mm;
v = 2u;

beginfig(1)
	z1 = origin;
	z100 = z1 + dir 270 * u;

	z2 = (x1, y1-2v);
	z200 = z2 + dir 90 * u;

	z3 = (x1-3v, y1-2v);
	z300 = z3 + dir 90 * u;
	z301 = z3 + dir 270 * u;

	z4 = (x1+3v, y1-2v);
	z400 = z4 + dir 90 * u;
	z401 = z4 + dir 270 * u;

	z6 = (x3, y3 - 2v);
	z600 = z6 + dir 90 * u;

	z7 = (x3 - 1.5v, y3 - 2v);
	z700 = z7 + dir 90 * u;

	z8 = (x3 + 1.5v, y3 - 2v); 
	z800 = z8 + dir 90 * u;
	z801 = z8 + dir 270 * u;
	
	z9 = (x4 - .75v, y4 - 2v); 
	z900 = z9 + dir 90 * u;

	z10 = (x4 + .75v, y4 - 2v);
	z1000 = z10 + dir 90 * u;

	z11 = (x8 - .75v, y6 - 2v);
	z1100 = z11 + dir 90 * u;
	z1101 = z11 + dir 270 * u;

	z12 = (x8 + .75v, y6 - 2v);
	z1200 = z12 + dir 90 * u;

	z13 = (x11, y11 - 2v);
	z1300 = z13 + dir 90 * u; 
	z1301 = z13 + dir 270 * u; 

	pickup pencircle scaled 1mm;

	pickup defaultpen;
	draw fullcircle scaled v;
	draw fullcircle scaled v shifted z2;
	draw fullcircle scaled v shifted z3;
	draw fullcircle scaled v shifted z4;

	draw fullcircle scaled v shifted z6;
	draw fullcircle scaled v shifted z7;
	draw fullcircle scaled v shifted z8;

	draw fullcircle scaled v shifted z9;
	draw fullcircle scaled v shifted z10;

	draw fullcircle scaled v shifted z11;
	draw fullcircle scaled v shifted z12;

	draw z100--z200;
	draw z100--z300;
	draw z100--z400;

	draw z301--z600;
	draw z301--z700;
	draw z301--z800;

	draw z401--z900;
	draw z401--z1000;

	draw z801--z1100;
	draw z801--z1200;

	picture p; p = currentpicture;

	transform t[]; 	
	t1 = identity shifted (z10 - z7 + 2v * dir 0);
	t2 = t1 shifted (z10 - z7 + 2v * dir 0);
	t3 = t2 shifted (z10 - z7 + 2v * dir 0);

	draw p transformed t1;
	draw p transformed t2;
	draw p transformed t3;

	pickup pencircle scaled .3mm;
	draw fullcircle scaled v;
	draw fullcircle scaled v shifted z3;
	draw fullcircle scaled v shifted z8;
	draw fullcircle scaled v shifted z11;

	drawarrow z100--z300;
	drawarrow z301--z800;
	drawarrow z801--z1100;
	

	draw fullcircle scaled v shifted z13 transformed t1;
	draw (z1101 transformed t1)--(z1300 transformed t1);

	draw fullcircle scaled v shifted z13 transformed t2;
	pickup defaultpen;
	draw (z1101 transformed t2)--(z1300 transformed t2);

	z14 = (x1301 + .5v, y1301 - .5v);
	z15 = (x1301 - .5v, y14 - v);
	z16 = (x1301 + .5v, y15 - v);
	z17 = (x1301 - .5v, y16 - v);
	z18 = (x1301, y17 - .5v);

	%dotlabels(14,15,16,17,18,19,20);

	draw (z1301{curl 0}..z14..z15..z16..z17..{curl 0}z18) transformed t2;

	pickup pencircle scaled .3mm;

	draw fullcircle scaled v shifted z13 transformed t3;
	draw fullcircle scaled v transformed t3;
	draw fullcircle scaled v shifted z3 transformed t3;
	draw fullcircle scaled v shifted z8 transformed t3;
	draw fullcircle scaled v shifted z11 transformed t3;
	drawarrow (z1300 transformed t3)--(z1101 transformed t3);
	drawarrow (z1100 transformed t3)--(z801 transformed t3);
	drawarrow (z800 transformed t3)--(z301 transformed t3);
	drawarrow (z300 transformed t3)--(z100 transformed t3);

	pickup defaultpen;
	picture px;
  	numeric h;
  	px := btex Bp etex;
  	h = ypart ( ulcorner px - llcorner px );
	boxjoin( 
		ypart( b.ne - a.ne ) = 0; 
		ypart( b.se - a.se ) = 0; 
	);
	boxit.a(btex Selection etex); 
	boxit.b(btex Expansion etex);
	boxit.c(btex Simulation etex);
	boxit.d(btex Back-propagation etex);

	a.c = z1 + 2v * dir 90;
	xpart(b.c) = xpart((z1 + 2v * dir 90) transformed t1);
	xpart(c.c) = xpart((z1 + 2v * dir 90) transformed t2);
	xpart(d.c) = xpart((z1 + 2v * dir 90) transformed t3);


	drawboxed(a,b,c,d);

	drawarrow a.e--b.w;
	drawarrow b.e--c.w;
	drawarrow c.e--d.w;

	z990 = d.e + v*dir0;
	z991 = z990 + 3v*dir90;
	z993 = a.w + v*dir180;
	z992 = z993 + 3v*dir90;

	boxjoin();
	boxit.r(btex Repeated x times etex);
	r.c = .5[z992,z991];

	drawunboxed(r);
	drawarrow d.e--z990--z991--r.e;
	drawarrow r.w--z992--z993--a.w;

endfig;
bye;
