import graph;
settings.outformat = "svg";
fill( box((0,0),(10,10)), RGB(34,40,49) );
settings.tex="pdflatex";

var reddish = RGB(240, 84, 84);
var bluish = RGB(48, 71, 94);
var whiteish = RGB(221, 221, 221);

// Drawing axes
unitsize(1cm);
var Ly = Label("$\mathbf{y}$", position=EndPoint, W, whiteish + fontsize(15pt));
var Lx = Label("$\mathbf{x}$", position=EndPoint, S, whiteish + fontsize(15pt));
draw((0,8)--(9.5,8), arrow=Arrow(), L=Lx, whiteish + linewidth(2.0pt));
draw((1,0)--(1,9.5), arrow=Arrow(), L=Ly, whiteish + linewidth(2.0pt));
// Drawing the function cosine from pi/2 to 3pi/2
pair C(real t){
    return (2*t - 1.1, 7*cos(t) + 8);
}
path s = graph(C, pi/2, 3*pi/2, n=100);
draw(s, reddish + linewidth(2.0pt));
//Draw points
pair A = C(pi/2);
pair B = C(3*pi/2);
pair V = C(pi);
var LA = Label("$(\frac{\pi}{2},0)$", position=EndPoint, N, whiteish + fontsize(15pt));
var LB = Label("$(\frac{3\pi}{2},0)$", position=EndPoint, N, whiteish + fontsize(15pt));
var LV = Label("$(\pi,-1)$", position=EndPoint, S, whiteish + fontsize(15pt));
dot(A, L=LA, bluish + linewidth(5.0pt));
dot(B, L=LB, bluish + linewidth(5.0pt));
dot(V, L=LV, bluish + linewidth(5.0pt));

//Dotted segment from V to A
draw((V.x, V.y)--(A.x, A.y), bluish + dashed + linewidth(1.0pt));
//Dotted segment from V to B
draw((V.x, V.y)--(B.x, B.y), bluish + dashed + linewidth(1.0pt));