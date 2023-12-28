---
layout: post
title: "Inverse Laplace Transform of 1/s"
description: "Calculating the inverse Laplace transform of 1/s the hard way"
#image: assets/images/pic01.jpg
---

## Why did I bother doing this?

The Laplace transform is a very useful tool in Electrical Circuit Analysis as it allows us to transform differential equations that come up from Kirchhoff's Laws into algebraic equations. It also lets us treat non trivial linear electrical components such as capacitors and inductors the same way we treat resistors.

Usually, people only care to calculate the forward transform from the time domain to the "s" domain, solve the algebraic equation, and then exploit the injectivity of the transform to infer the inverse from a look up table, which is often taken from granted.

Out of curiosity, I wanted to see how much work would it take to calculate the inverse transform of a simple function such as $\frac{1}{s}$. The way to calculate the inverse directly is with Mellin's Inverse Formula:

\begin{equation}
\label{eq:inverse_laplace}
f(t) = \frac{1}{2\pi i}\lim_{T\to\infty}\int_{\sigma - iT}^{\sigma + iT}F(s)e^{ts}ds
\end{equation}

## Calculation

By inspecting the Mellin formula \ref{eq:inverse_laplace}, we can see that the variable $\sigma$ is not uniquely defined. This is because we're meant to choose $\sigma$ so that the segment from $\sigma - iT$ to $\sigma + iT$ is at the left of the poles of $F(s)$. Also, the $\frac{1}{2\pi i}$ term is already leaving a hint of how we're compute this integral: with Cauchy's integral theorem (or residue theorem). Just to refresh our memory, the theorem states that if $f$ is analytic in a simply connected domain except for a finite number of poles, then for any closed rectifiable curve $C$ that encloses a pole in $z=a$, we have:

\begin{equation}
\label{eq:cauchy}
f(a) = \frac{1}{2\pi i}\oint_{C}\frac{f(z)}{z-a}dz
\end{equation}

Looking at the Mellin's formula for our case, we see that we have only a single pole at $z=0$, as our kernel would be $\frac{e^{st}}{s}$. So, we can choose any curve $C$ that goes around the origin, and we'll have:

\begin{equation}
\label{eq:cauchy_with_kernel}
f(t) = \frac{1}{2\pi i}\oint_{C}\frac{e^{st}}{s}ds
\end{equation}

Although we could use any curve hypothetically, we will chose a special type of curve, called the "Bromwitch contour", which looks as follows:

{:refdef: style="text-align: center;"}
![Bromwitch contour]({{ site.baseurl }}/assets/images/2023/2023-12-27-inverse-laplace/curve.svg)
{: refdef}

Now, if you recall our definition of the Cauchy's integral theorem, you might be intrigued by the fact that this curve goes exactly through the origin, which is a pole of out kernel. One way around this is to stretch the $C_1$ segment to the right by an amount $a$.

{:refdef: style="text-align: center;"}
![Bromwitch contour with a]({{ site.baseurl }}/assets/images/2023/2023-12-27-inverse-laplace/curve_stretch.svg)
{: refdef}

With this new curve we can be absolutely sure that Cauchy's intergral theorem applies. Going counterclockwise in the curve, we have:

\begin{equation}
\label{eq:cauchy_counterclockwise}
2\pi i = \oint_{C}\frac{e^{st}}{s}\mathrm{d}s = \int_{C_1}\frac{e^{st}}{s}\mathrm{d}s + \int_{C_3}\frac{e^{st}}{s}\mathrm{d}s + \int_{C_2}\frac{e^{st}}{s}\mathrm{d}s + \int_{C_4}\frac{e^{st}}{s}\mathrm{d}s
\end{equation}

With paths parametrized as follows:

$$C_1(y) = a + iy, \quad y \in [-R, R]$$

$$C_2(\theta) = Re^{i\theta}, \quad \theta \in \left[\frac{\pi}{2}, \frac{3\pi}{2}\right]$$

$$C_3(x) = x + iR, \quad x \in [a, 0]$$

$$C_4(x) = x - iR, \quad x \in [0, a]$$

Let us first look at $C_3$ and $C_4$.

$$\int_{C_3}\frac{e^{st}}{s}\mathrm{d}s = \int_{a}^{0}\frac{e^{(x + iR)t}}{x + iR}\mathrm{d}x$$

$$\int_{C_4}\frac{e^{st}}{s}\mathrm{d}s = \int_{0}^{a}\frac{e^{(x - iR)t}}{x - iR}\mathrm{d}x$$

For both cases, we can look at their absolute value and bound them by the maximum value with the help of the ML and integral modulus inequalities. Since both cases are analogous except by a minus sign with the substitution $R \to -R$, I'll only work the case for $C_3$.

$$\left|\int_{a}^{0}\frac{e^{(x + iR)t}}{x + iR} \mathrm{d} x\right| \leq \int_{0}^{a}\left|\frac{e^{(x + iR)t}}{x + iR}\right| \mathrm{d} x = \int_{0}^{a} \frac{e^{xt}}{\sqrt{x^2 + R^2}} \mathrm{d} x \leq a\sup_{x\in\left[0,a\right]}\frac{e^{xt}}{\sqrt{x^2 + R^2}} \leq a\frac{e^{at}}{R}$$

As $R \to \infty$, we have that $a\frac{e^{at}}{R} \to 0$, so we can drop both $C_3$ and $C_4$ integrals as they converge to zero. Notice that we could have reached the same conclusion by making $a\to 0$.

The $C_2$ integral, however, won't be so easy to get rid of. We can parametrize it as follows:

$$\int_{C_2}\frac{e^{st}}{s}\mathrm{d}s = i\int_{\frac{\pi}{2}}^{\frac{3\pi}{2}}\exp\left(Rte^{i\theta}\right)\mathrm{d}\theta = i\int_{\frac{\pi}{2}}^{\frac{3\pi}{2}}e^{tR\cos\theta}e^{iRt\sin\theta}\mathrm{d}\theta$$

Naturally, we look at the absolute value of this integral as well.

$$\left|i\int_{\frac{\pi}{2}}^{\frac{3\pi}{2}}e^{tR\cos\theta}e^{iRt\sin\theta}\mathrm{d}\theta\right| \leq \int_{\frac{\pi}{2}}^{\frac{3\pi}{2}}e^{tR\cos\theta}\mathrm{d}\theta$$

I have seen all sorts of half-assed explanations as to why this integral should converge to zero in the limit $R\to\infty$. One for example argued that the cosine on the interval $\left(\frac{\pi}{2}, \frac{3\pi}{2}\right)$ is always negative, so we could bound the integral by $\frac{\pi}{2} e^{-tR}$. As I see this as a very lazy and careless approach. Instead, I will rely on a technique that I learned on a very old book I have on my shelf called "An Imaginary Tale" {% cite book:Nahin1998-wi %}. In there, the author (on box 7.1) uses the convexity of the cosine to constrain the integral within two segments. For our case, those segments will be the ones in the picture. 

{:refdef: style="text-align: center;"}
![Convexity of cosine]({{ site.baseurl }}/assets/images/2023/2023-12-27-inverse-laplace/cosine.svg)
{: refdef}

$$\gamma_1: y = -\frac{2}{\pi}x + 1$$

$$\gamma_2: y = \frac{2}{\pi}x - 3$$

Now we can divide the $C_2$ integral into two parts, one from $(\frac{\pi}{2}, \pi)$ and another from $(\pi, \frac{3\pi}{2})$, and then apply the inequality with the segments $\gamma_1$ and $\gamma_2$.

$$\int_{\frac{\pi}{2}}^{\frac{3\pi}{2}}e^{tR\cos\theta}\mathrm{d}\theta = \int_{\frac{\pi}{2}}^{\pi}e^{tR\cos\theta}\mathrm{d}\theta + \int_{\pi}^{\frac{3\pi}{2}}e^{tR\cos\theta}\mathrm{d}\theta$$

$$\leq \int_{\frac{\pi}{2}}^{\pi}\exp\left(tR\left(-\frac{2}{\pi}\theta + 1\right)\right)\mathrm{d}\theta + \int_{\pi}^{\frac{3\pi}{2}}\exp\left(tR\left(\frac{2}{\pi}\theta -3\right)\right)\mathrm{d}\theta$$

$$ = -\frac{\pi}{2tR}e^{tR}\left. e^{-\frac{2tR}{\pi}\theta}\right|^{\pi}_{\frac{\pi}{2}} + \frac{\pi}{2tR}e^{-3tR}\left. e^{\frac{2tR}{\pi}\theta}\right|_{\pi}^{\frac{3\pi}{2}}$$

$$ = \frac{\pi}{2tR}\left[-(e^{-tR} - 1) + 1 - e^{-tR}\right] $$

$$ = \frac{\pi}{tR}\left(1-e^{-tR}\right)$$

Finally, as $R\to\infty$, the above tends to zero. So we can conclude that $C_2$ also converges to zero.

The only integral left is $C_1$ ,which is the integral that we wanted to compute:

$$\int_{C_1}\frac{e^{st}}{s}\mathrm{d}s = \int_{a - iR}^{a + iR}\frac{e^{st}}{s}\mathrm{d}s$$

Plugging the results of all paths $C_1$ to $C_4$ back into Cauchy's theorem and taking the limit, we have:

\begin{equation}
\label{eq:cauchy_limit}
2\pi i = \lim_{R\to\infty}\int_{a - iR}^{a + iR}\frac{e^{st}}{s}\mathrm{d}s
\end{equation}

Referring back to Mellin's formula, we can then conclude that:

\begin{equation}
\label{eq:mellin_final}
f(t) = \lim_{R\to\infty}\int_{a - iR}^{a + iR}\frac{e^{st}}{s}\mathrm{d}s = 1
\end{equation}

That is, the inverse Laplace transform of $\frac{1}{s}$ is $1$. You can check by yourself that the converse also agrees with our result.