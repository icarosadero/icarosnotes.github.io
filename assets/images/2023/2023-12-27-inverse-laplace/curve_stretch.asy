settings.outformat = "svg";
fill( box((0,0),(10,10)), RGB(34,40,49) );
settings.tex="pdflatex";

var reddish = RGB(240, 84, 84);
var bluish = RGB(48, 71, 94);
var whiteish = RGB(221, 221, 221);
var a = -2;
var origin = (5,5);

Label R = Label("$R$", position=MidPoint, align=2E, whiteish + fontsize(15pt));
Label A = Label("$a$", position=MidPoint, align=2N, whiteish + fontsize(15pt));
Label C3 = Label("$C_3$", position=MidPoint, align=2S, bluish + fontsize(15pt));
Label C4 = Label("$C_4$", position=MidPoint, align=2S, bluish + fontsize(15pt));

// Drawing axes
unitsize(1cm);
draw((0,5)--(10,5), arrow=Arrow(), whiteish + linewidth(2.0pt));
draw((5,0)--(5,10), arrow=Arrow(), whiteish + linewidth(2.0pt));

// Semi circle
draw(arc((5,5), 3, 270, 90), reddish + linewidth(2.0pt));
draw((7,8)--(7,2), reddish + linewidth(2.0pt));

// Distance
draw((7.5,8)--(7.5,5), whiteish + linewidth(1.0pt), bar=Bars, L=R);
draw((origin - (0,-3.2))--(origin - (a,-3.2)), whiteish + linewidth(1.0pt), bar=Bars, L=A);

// Extension
draw((origin - (0,-3))--(origin - (a,-3)), L = C3, bluish + linewidth(2.0pt));
draw((origin - (0,3))--(origin - (a,3)), L = C4, bluish + linewidth(2.0pt));

// Labeling
label("$\mathbf{x}$", (9.8,5), S, white + fontsize(15pt));
label("$\mathbf{y}$", (5,9.8), W, white + fontsize(15pt));
label("$C_1$", (7,3), E, reddish + fontsize(15pt));
label("$C_2$", (3,7), E, reddish + fontsize(15pt));