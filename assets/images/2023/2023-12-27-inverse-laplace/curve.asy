settings.outformat = "svg";
fill( box((0,0),(10,10)), RGB(34,40,49) );
settings.tex="pdflatex";

var reddish = RGB(240, 84, 84);
var bluish = RGB(48, 71, 94);
var whiteish = RGB(221, 221, 221);

Label R = Label("$R$", position=MidPoint, align=2E, whiteish + fontsize(15pt));

// Drawing axes
unitsize(1cm);
draw((0,5)--(10,5), arrow=Arrow(), whiteish + linewidth(2.0pt));
draw((5,0)--(5,10), arrow=Arrow(), whiteish + linewidth(2.0pt));

// Semi circle
draw(arc((5,5), 3, 270, 90), reddish + linewidth(2.0pt));
draw((5,8)--(5,2), reddish + linewidth(2.0pt));

// Distance
draw((7,8)--(7,5), whiteish + linewidth(1.0pt), bar=Bars, L=R);

// Labeling
label("$\mathbf{x}$", (9.8,5), S, whiteish + fontsize(15pt));
label("$\mathbf{y}$", (5,9.8), W, whiteish + fontsize(15pt));
label("$C_1$", (5.1,3), E, reddish + fontsize(15pt));
label("$C_2$", (3,7), E, reddish + fontsize(15pt));