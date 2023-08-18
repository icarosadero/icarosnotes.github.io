---
layout: post
title: "Elliptical Machine"
description: "A geometric analysis of the elliptical machine"
#image: {{ site.baseurl }}/assets/images/pic01.jpg
---

<style>
.responsive-wrap iframe{ width: 100%;}
</style>

One day, while I was at the gym, I took notice of a workout machine that seemed to be a mixture of an indoor cycling machine and a treadmill, to which they gave the name "Elliptical Machine", alluding to the trajectory of the pedals when it is being used. The name sparked my curiosity and I decided to investigate why such a movement would be an ellipse.

Appearing to be a simple problem, I set up the most important geometric aspect of the machine into the following drawing:

<div class="responsive-wrap">
<iframe src="https://www.geogebra.org/geometry/rzryq9hs?embed" height="600" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" style="border: 1px solid #e4e4e4;border-radius: 4px;" frameborder="0"></iframe>
</div>

The reference picture on the background was a random generic model I found on the [internet](https://www.mrmarketplace.com/elliptical-xc-140/) with dimensions measured in millimeters. The main point to consider is that the angle $\theta$ is sufficient to describe the entire dynamics of the system. This can be inferred by noticing that both segments $\overline{BZ}$ and $\overline{OA}$ span circles of radii $b$ and $r$ respectively. By fixing the angle $\theta$, the point $A$ stays fixed, and the segment $\overline{AZ}$ can only move along a circle of radius $a$, which intersects the circle of radius $b$ at two points, $Z$ and $F$. Since the segment $\overline{AZ}$ is not supposed to be all the way up there due to mechanical constraints of the machine and the fact that this would be very challenging for a person to accomplish (probably not very beneficial to their fitness either), we can discard this point and consider only the point $Z$.

<div class="responsive-wrap">
<iframe src="https://www.geogebra.org/geometry/xfdw36kp?embed" height="600" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" style="border: 1px solid #e4e4e4;border-radius: 4px;" frameborder="0"></iframe>
</div>

Based on this geometric configuration, the system of equations describing the trajectory of the point $Z$ in function of $\theta$ is given by:

$$
\begin{cases}
{\left(r \cos\left(\theta\right) - x\right)}^{2} + {\left(r \sin\left(\theta\right) - y\right)}^{2} = a^{2} \\
{\left(Q - x\right)}^{2} + {\left(H - y\right)}^{2} = b^{2}
\end{cases}
$$

Whose solutions, although analytical, are not trivial in the slightest and wouldn't fit the screen if rendered. Here's the output I got from SageMath:

<details>
<summary>$x_1$</summary>
<code>
x == 1/2*(2*Q*r^2*cos(theta)^2 - H^2*Q - Q^3 - Q*a^2 + Q*b^2 - Q*r^2 - (r^3 + (H^2 - Q^2 - a^2 + b^2)*r)*cos(theta) + 2*(H*r^2*cos(theta) + H*Q*r)*sin(theta) + sqrt(4*(H^2 - Q^2)*r^2*cos(theta)^2 - H^4 - 2*H^2*Q^2 - Q^4 - a^4 - b^4 - r^4 + 2*(H^2 + Q^2)*a^2 + 2*(H^2 + Q^2 + a^2)*b^2 - 2*(3*H^2 + Q^2 - a^2 - b^2)*r^2 + 4*(Q*r^3 + (H^2*Q + Q^3 - Q*a^2 - Q*b^2)*r)*cos(theta) - 4*(2*H*Q*r^2*cos(theta) - H*r^3 - (H^3 + H*Q^2 - H*a^2 - H*b^2)*r)*sin(theta))*(r*sin(theta) - H))/(2*Q*r*cos(theta) + 2*H*r*sin(theta) - H^2 - Q^2 - r^2)
</code>
</details>

<details>
<summary>$y_1$</summary>
<code>
y == -1/2*(2*H*r^2*cos(theta)^2 - 2*H*Q*r*cos(theta) + H^3 + H*Q^2 + H*a^2 - H*b^2 - H*r^2 - (2*Q*r^2*cos(theta) - r^3 + (H^2 - Q^2 + a^2 - b^2)*r)*sin(theta) + sqrt(4*(H^2 - Q^2)*r^2*cos(theta)^2 - H^4 - 2*H^2*Q^2 - Q^4 - a^4 - b^4 - r^4 + 2*(H^2 + Q^2)*a^2 + 2*(H^2 + Q^2 + a^2)*b^2 - 2*(3*H^2 + Q^2 - a^2 - b^2)*r^2 + 4*(Q*r^3 + (H^2*Q + Q^3 - Q*a^2 - Q*b^2)*r)*cos(theta) - 4*(2*H*Q*r^2*cos(theta) - H*r^3 - (H^3 + H*Q^2 - H*a^2 - H*b^2)*r)*sin(theta))*(r*cos(theta) - Q))/(2*Q*r*cos(theta) + 2*H*r*sin(theta) - H^2 - Q^2 - r^2)
</code>
</details>

<details>
<summary>$x_2$</summary>
<code>
x == 1/2*(2*Q*r^2*cos(theta)^2 - H^2*Q - Q^3 - Q*a^2 + Q*b^2 - Q*r^2 - (r^3 + (H^2 - Q^2 - a^2 + b^2)*r)*cos(theta) + 2*(H*r^2*cos(theta) + H*Q*r)*sin(theta) - sqrt(4*(H^2 - Q^2)*r^2*cos(theta)^2 - H^4 - 2*H^2*Q^2 - Q^4 - a^4 - b^4 - r^4 + 2*(H^2 + Q^2)*a^2 + 2*(H^2 + Q^2 + a^2)*b^2 - 2*(3*H^2 + Q^2 - a^2 - b^2)*r^2 + 4*(Q*r^3 + (H^2*Q + Q^3 - Q*a^2 - Q*b^2)*r)*cos(theta) - 4*(2*H*Q*r^2*cos(theta) - H*r^3 - (H^3 + H*Q^2 - H*a^2 - H*b^2)*r)*sin(theta))*(r*sin(theta) - H))/(2*Q*r*cos(theta) + 2*H*r*sin(theta) - H^2 - Q^2 - r^2)
</code>
</details>

<details>
<summary>$y_2$</summary>
<code>
y == -1/2*(2*H*r^2*cos(theta)^2 - 2*H*Q*r*cos(theta) + H^3 + H*Q^2 + H*a^2 - H*b^2 - H*r^2 - (2*Q*r^2*cos(theta) - r^3 + (H^2 - Q^2 + a^2 - b^2)*r)*sin(theta) - sqrt(4*(H^2 - Q^2)*r^2*cos(theta)^2 - H^4 - 2*H^2*Q^2 - Q^4 - a^4 - b^4 - r^4 + 2*(H^2 + Q^2)*a^2 + 2*(H^2 + Q^2 + a^2)*b^2 - 2*(3*H^2 + Q^2 - a^2 - b^2)*r^2 + 4*(Q*r^3 + (H^2*Q + Q^3 - Q*a^2 - Q*b^2)*r)*cos(theta) - 4*(2*H*Q*r^2*cos(theta) - H*r^3 - (H^3 + H*Q^2 - H*a^2 - H*b^2)*r)*sin(theta))*(r*cos(theta) - Q))/(2*Q*r*cos(theta) + 2*H*r*sin(theta) - H^2 - Q^2 - r^2)
</code>
</details>

Regardless of what they look like, we already knew the solutions must be either the point $Z$ or $F$. The point of interest, however, is where the pedal is located, which from the schematics seems to be well approximated as the midpoint of the segment $\overline{AZ}$. The only thing left to do then is to take the average of the aforementioned solutions with the point $A$. A less obnoxious way to do this in SageMath fast is to treat the points as lying in the complex plane.

<details>
<summary>First solution</summary>
<code>
1/2*r*cos(theta) + 1/2*I*r*sin(theta) + 1/4*(2*(-I*H + Q)*r^2*cos(theta)^2 - I*H^3 - H^2*Q - I*H*Q^2 - Q^3 + (-I*H - Q)*a^2 + (I*H + Q)*b^2 + (I*H - Q)*r^2 - (r^3 + (H^2 - 2*I*H*Q - Q^2 - a^2 + b^2)*r)*cos(theta) + (2*(H + I*Q)*r^2*cos(theta) - I*r^3 + (I*H^2 + 2*H*Q - I*Q^2 + I*a^2 - I*b^2)*r)*sin(theta) - sqrt(4*(H^2 - Q^2)*r^2*cos(theta)^2 - H^4 - 2*H^2*Q^2 - Q^4 - a^4 - b^4 - r^4 + 2*(H^2 + Q^2)*a^2 + 2*(H^2 + Q^2 + a^2)*b^2 - 2*(3*H^2 + Q^2 - a^2 - b^2)*r^2 + 4*(Q*r^3 + (H^2*Q + Q^3 - Q*a^2 - Q*b^2)*r)*cos(theta) - 4*(2*H*Q*r^2*cos(theta) - H*r^3 - (H^3 + H*Q^2 - H*a^2 - H*b^2)*r)*sin(theta))*(I*r*cos(theta) - r*sin(theta) + H - I*Q))/(2*Q*r*cos(theta) + 2*H*r*sin(theta) - H^2 - Q^2 - r^2)
</code>
</details>

<details>
<summary>Second solution</summary>
<code>
1/2*r*cos(theta) + 1/2*I*r*sin(theta) + 1/4*(2*(C*cos(gamma) - I*C*sin(gamma))*r^2*cos(theta)^2 - (C*cos(gamma) - I*C*sin(gamma))*r^2 - (C^3 + C*a^2 - C*b^2)*cos(gamma) - (r^3 - (2*C^2*cos(gamma)^2 + 2*I*C^2*cos(gamma)*sin(gamma) - C^2 + a^2 - b^2)*r)*cos(theta) - (I*C^3 + I*C*a^2 - I*C*b^2)*sin(gamma) - (2*(-I*C*cos(gamma) - C*sin(gamma))*r^2*cos(theta) + I*r^3 + (2*I*C^2*cos(gamma)^2 - 2*C^2*cos(gamma)*sin(gamma) - I*C^2 - I*a^2 + I*b^2)*r)*sin(theta) + sqrt(-4*(2*C^2*cos(gamma)^2 - C^2)*r^2*cos(theta)^2 - C^4 + 2*C^2*a^2 - a^4 - b^4 - r^4 + 2*(C^2 + a^2)*b^2 + 2*(2*C^2*cos(gamma)^2 - 3*C^2 + a^2 + b^2)*r^2 + 4*(C*r^3*cos(gamma) + (C^3 - C*a^2 - C*b^2)*r*cos(gamma))*cos(theta) - 4*(2*C^2*r^2*cos(gamma)*cos(theta)*sin(gamma) - C*r^3*sin(gamma) - (C^3 - C*a^2 - C*b^2)*r*sin(gamma))*sin(theta))*(-I*C*cos(gamma) + I*r*cos(theta) + C*sin(gamma) - r*sin(theta)))/(2*C*r*cos(gamma)*cos(theta) + 2*C*r*sin(gamma)*sin(theta) - C^2 - r^2)
</code>
</details>

(The symbol "I" in the equations above stands for the imaginary number)

With that, we can throw some numbers and see what the trajectories look like. For example, here are a few plots for the first solution:

{: refdef: style="text-align: center;"}
![First Solution Plot]({{ site.baseurl }}/assets/images/2023/2023-05-05-elliptical/plot1.svg)
![First Solution Plot]({{ site.baseurl }}/assets/images/2023/2023-05-05-elliptical/plot2.svg)
{: refdef}

They look round, but definitely not elliptical. The second solution is a bit better except for the first one:

{: refdef: style="text-align: center;"}
![Second Solution Plot]({{ site.baseurl }}/assets/images/2023/2023-05-05-elliptical/plot3.svg)
![Second Solution Plot]({{ site.baseurl }}/assets/images/2023/2023-05-05-elliptical/plot4.svg)
![Second Solution Plot]({{ site.baseurl }}/assets/images/2023/2023-05-05-elliptical/plot5.svg)
{: refdef}

If we decide to use realistic values for the parameters, as the ones from the schematic on the geometric construction, we get something that indeed looks like a squished ellipse:

{: refdef: style="text-align: center;"}
![Second Solution Plot]({{ site.baseurl }}/assets/images/2023/2023-05-05-elliptical/realistic.svg)
{: refdef}

## Asymptotic Behavior

From this last set of solutions, it becomes clear that the larger the parameter $b$ is, the more elliptical the trajectory appears to be. An interesting limit case is if we make $b$ infinitely larger while also moving the point $B$ infinitely far away from the origin along the $y$ axis. This would correspond to letting the point $Z$ only move along the $x$ direction, akin to the movement of the piston of a steam engine like in the picture below.

{: refdef: style="text-align: center;"}
![Steam Engine]({{ site.baseurl }}/assets/images/2023/2023-05-05-elliptical/steam_engine.gif)
{: refdef}

> [Source](https://www.cs.mcgill.ca/~rwest/wikispeedia/wpcd/wp/s/Steam_engine.htm)

For that, we define the quantity $y_0$ as the difference between $H$ and $b$ and demand it to be constant. Using this to replace $b$ in the solutions and taking the limit $H\to\infty$, we end up with:

$$r \cos\left(\theta\right) + \frac{1}{2} i \, r \sin\left(\theta\right) + i\frac{1}{2}\, y_{0} + \frac{1}{2}\, \sqrt{a^2 - \left(r\sin{\theta} - y_0\right)^2}$$

$$r \cos\left(\theta\right) + \frac{1}{2} i \, r \sin\left(\theta\right) + i\frac{1}{2}\, y_{0} - \frac{1}{2}\, \sqrt{a^2 - \left(r\sin{\theta} - y_0\right)^2}$$


By setting $y_0=0$, we get:

$$r \cos\left(\theta\right) + \frac{1}{2} i \, r \sin\left(\theta\right) + \frac{1}{2} \, \sqrt{a^{2} - r^{2} \sin\left(\theta\right)^{2}}$$

$$r \cos\left(\theta\right) + \frac{1}{2} i \, r \sin\left(\theta\right) - \frac{1}{2} \, \sqrt{a^{2} - r^{2} \sin\left(\theta\right)^{2}}$$

In the steam analogy, this is the same as letting the linear shaft be aligned with the rotation axis of the wheel The resulting trajectory is "egg-shaped" (blue curve) and decently approximates an actual ellipse (red curve):

{: refdef: style="text-align: center;"}
![Egg-shaped]({{ site.baseurl }}/assets/images/2023/2023-05-05-elliptical/egg.svg)
{: refdef}

## Conclusion

Not even on asymptotic grounds does the trajectory of this machine really equates to an ellipse, although it fairly approximates one in some cases. However, this discrepancy makes no real difference in the operation of the machine, as any "ellipse-like" shape would dampen the impact of the movement for the user. The questioning of the elliptical trajectory is purely pendantic ad unimportant, but it does serve as a challenging problem to tackle.