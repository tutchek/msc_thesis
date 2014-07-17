prologues:=3;
verbatimtex \input cs-pagella etex

input boxes;

u = 1.5mm;
v = 2u;

beginfig(1)
	pickup defaultpen;
	boxit.erp(btex ERP system etex); 
	% (ERP, vyvažování) $\rightarrow$ Plánování $\rightarrow$ Doklady v ERP
	boxit.dem(btex Get demands etex); 
	boxit.bal(btex Balance goods etex); 
	boxit.pl(btex Plan transfers etex);
	boxit.gen(btex Generate documents etex);

	pl.c = origin;
	
	(dem.n-dem.s) = (pl.n - pl.s) = (erp.n - erp.s) = (bal.n - bal.s) = (gen.n - gen.s);

	dem.e = pl.n + (dir 90) * 3v + (dir 180) * .5v;
	bal.w = pl.n + (dir 90) * 3v + (dir 0) * .5v;
	gen.n = pl.s + (dir 270) * 2v;

	erp.s = dem.e + (dir 0) * .5v + (dir 90) * 3v;


	drawboxed(erp,bal,pl,gen,dem);

	drawarrow erp.s{down}..{down}dem.n;
	drawarrow gen.w{left}..{right}erp.w;
	drawarrow dem.s{down}..{down}(pl.n + (dir 180) * v);
	drawarrow bal.s{down}..{down}(pl.n + (dir 0) * v);
	drawarrow pl.s--gen.n;
	drawarrow erp.s{down}..{down}bal.n;
endfig;
bye;
