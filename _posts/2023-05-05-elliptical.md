---
layout: post
title: "Elliptical Machine"
description: "A geometric analysis of the elliptical machine"
#image: assets/images/pic01.jpg
---

<style>
.responsive-wrap iframe{ width: 100%;}
</style>

One day, while I was at the gym, I took notice of a workout machine that seemed to be a mixture of an indoor cycling machine and a treadmill, to which they gave the name "Elliptical Machine", alluding to the trajectory of the pedals when it is being used. The name sparked my curiosity and I decided to investigate why such a movement would be an ellipse.

Appearing to be a simple problem, I set up the most important geometric aspect of the machine into the following drawing:

<div class="responsive-wrap">
<iframe src="https://www.geogebra.org/geometry/rzryq9hs?embed" height="600" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" style="border: 1px solid #e4e4e4;border-radius: 4px;" frameborder="0"></iframe>
</div>

The reference picture on the background was a random generic model I found on the [internet](https://www.mrmarketplace.com/elliptical-xc-140/) with dimensions measured in millimeters. The main point to consider is that the angle $\theta$ is sufficient to describe the entire dynamics of the system. This can be inferred by noticing that both segments $\overline{BZ}$ and $\overline{OA}$ span circles of radii $b$ and $r$ respectively. By fixing the angle $\theta$, the point $A$ stays fixed, and the segment $\overline{AZ}$ can only move along a circle of radius $a$, which intersect the circle of radius $b$ at two points, $Z$ and $F$. Since the segment $\overline{AZ}$ is not supposed to be all the way up there due to mechanical constraints of the machine and the fact that this would be very challenging for a person to accomplish (probably not very beneficial to their fitness either), we can discard this point and consider only the point $Z$.

<div class="responsive-wrap">
<iframe src="https://www.geogebra.org/geometry/xfdw36kp?embed" height="600" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" style="border: 1px solid #e4e4e4;border-radius: 4px;" frameborder="0"></iframe>
</div>

Based on this geometric configuration, the system of equations describing the trajectory of the point $Z$ in function of $\theta$ is given by:

$$
\begin{cases}
{\left(r \cos\left(\theta\right) - x\right)}^{2} + {\left(r \sin\left(\theta\right) - y\right)}^{2} = a^{2} \\
{\left(C \cos\left(\gamma\right) - x\right)}^{2} + {\left(C \sin\left(\gamma\right) - y\right)}^{2} = b^{2}
\end{cases}
$$

Whose solutions, although analytical, are not trivial in the slightest and wouldn't fit the screen if rendered. Here's the output I got from SageMath:

<details>
<summary>$x_1$</summary>
x == 1/2*(2*C*r^2*cos(gamma)*cos(theta)^2 - C*r^2*cos(gamma) - (C^3 + C*a^2 - C*b^2)*cos(gamma) - (r^3 - (2*C^2*cos(gamma)^2 - C^2 + a^2 - b^2)*r)*cos(theta) + 2*(C^2*r*cos(gamma)*sin(gamma) + C*r^2*cos(theta)*sin(gamma))*sin(theta) - sqrt(-4*(2*C^2*cos(gamma)^2 - C^2)*r^2*cos(theta)^2 - C^4 + 2*C^2*a^2 - a^4 - b^4 - r^4 + 2*(C^2 + a^2)*b^2 + 2*(2*C^2*cos(gamma)^2 - 3*C^2 + a^2 + b^2)*r^2 + 4*(C*r^3*cos(gamma) + (C^3 - C*a^2 - C*b^2)*r*cos(gamma))*cos(theta) - 4*(2*C^2*r^2*cos(gamma)*cos(theta)*sin(gamma) - C*r^3*sin(gamma) - (C^3 - C*a^2 - C*b^2)*r*sin(gamma))*sin(theta))*(C*sin(gamma) - r*sin(theta)))/(2*C*r*cos(gamma)*cos(theta) + 2*C*r*sin(gamma)*sin(theta) - C^2 - r^2)
</details>

<details>
<summary>$y_1$</summary>
y == 1/2*(2*C^2*r*cos(gamma)*cos(theta)*sin(gamma) - 2*C*r^2*cos(theta)^2*sin(gamma) + C*r^2*sin(gamma) - (C^3 + C*a^2 - C*b^2)*sin(gamma) + (2*C*r^2*cos(gamma)*cos(theta) - r^3 - (2*C^2*cos(gamma)^2 - C^2 - a^2 + b^2)*r)*sin(theta) + sqrt(-4*(2*C^2*cos(gamma)^2 - C^2)*r^2*cos(theta)^2 - C^4 + 2*C^2*a^2 - a^4 - b^4 - r^4 + 2*(C^2 + a^2)*b^2 + 2*(2*C^2*cos(gamma)^2 - 3*C^2 + a^2 + b^2)*r^2 + 4*(C*r^3*cos(gamma) + (C^3 - C*a^2 - C*b^2)*r*cos(gamma))*cos(theta) - 4*(2*C^2*r^2*cos(gamma)*cos(theta)*sin(gamma) - C*r^3*sin(gamma) - (C^3 - C*a^2 - C*b^2)*r*sin(gamma))*sin(theta))*(C*cos(gamma) - r*cos(theta)))/(2*C*r*cos(gamma)*cos(theta) + 2*C*r*sin(gamma)*sin(theta) - C^2 - r^2)
</details>

<details>
<summary>$x_2$</summary>
x == 1/2*(2*C*r^2*cos(gamma)*cos(theta)^2 - C*r^2*cos(gamma) - (C^3 + C*a^2 - C*b^2)*cos(gamma) - (r^3 - (2*C^2*cos(gamma)^2 - C^2 + a^2 - b^2)*r)*cos(theta) + 2*(C^2*r*cos(gamma)*sin(gamma) + C*r^2*cos(theta)*sin(gamma))*sin(theta) + sqrt(-4*(2*C^2*cos(gamma)^2 - C^2)*r^2*cos(theta)^2 - C^4 + 2*C^2*a^2 - a^4 - b^4 - r^4 + 2*(C^2 + a^2)*b^2 + 2*(2*C^2*cos(gamma)^2 - 3*C^2 + a^2 + b^2)*r^2 + 4*(C*r^3*cos(gamma) + (C^3 - C*a^2 - C*b^2)*r*cos(gamma))*cos(theta) - 4*(2*C^2*r^2*cos(gamma)*cos(theta)*sin(gamma) - C*r^3*sin(gamma) - (C^3 - C*a^2 - C*b^2)*r*sin(gamma))*sin(theta))*(C*sin(gamma) - r*sin(theta)))/(2*C*r*cos(gamma)*cos(theta) + 2*C*r*sin(gamma)*sin(theta) - C^2 - r^2)
</details>

<details>
<summary>$y_2$</summary>
y == 1/2*(2*C^2*r*cos(gamma)*cos(theta)*sin(gamma) - 2*C*r^2*cos(theta)^2*sin(gamma) + C*r^2*sin(gamma) - (C^3 + C*a^2 - C*b^2)*sin(gamma) + (2*C*r^2*cos(gamma)*cos(theta) - r^3 - (2*C^2*cos(gamma)^2 - C^2 - a^2 + b^2)*r)*sin(theta) - sqrt(-4*(2*C^2*cos(gamma)^2 - C^2)*r^2*cos(theta)^2 - C^4 + 2*C^2*a^2 - a^4 - b^4 - r^4 + 2*(C^2 + a^2)*b^2 + 2*(2*C^2*cos(gamma)^2 - 3*C^2 + a^2 + b^2)*r^2 + 4*(C*r^3*cos(gamma) + (C^3 - C*a^2 - C*b^2)*r*cos(gamma))*cos(theta) - 4*(2*C^2*r^2*cos(gamma)*cos(theta)*sin(gamma) - C*r^3*sin(gamma) - (C^3 - C*a^2 - C*b^2)*r*sin(gamma))*sin(theta))*(C*cos(gamma) - r*cos(theta)))/(2*C*r*cos(gamma)*cos(theta) + 2*C*r*sin(gamma)*sin(theta) - C^2 - r^2)
</details>

Regardless of what they look like, we already knew the solutions must be either the point $Z$ or $F$. The point of interest, however, is where the pedal is located, which from the schematics seems to be well approximated as the midpoint of the segment $\overline{AZ}$. The only thing left to do then is to take the average of the aforementioned solutions with the point $A$. A less obnoxious way to do this in SageMath fast is to treat the points as lying in the complex plane.

<details>
<summary>First solution</summary>
1/2*r*cos(theta) + 1/2*I*r*sin(theta) + 1/4*(2*(C*cos(gamma) - I*C*sin(gamma))*r^2*cos(theta)^2 - (C*cos(gamma) - I*C*sin(gamma))*r^2 - (C^3 + C*a^2 - C*b^2)*cos(gamma) - (r^3 - (2*C^2*cos(gamma)^2 + 2*I*C^2*cos(gamma)*sin(gamma) - C^2 + a^2 - b^2)*r)*cos(theta) + (-I*C^3 - I*C*a^2 + I*C*b^2)*sin(gamma) + (2*(I*C*cos(gamma) + C*sin(gamma))*r^2*cos(theta) - I*r^3 + (-2*I*C^2*cos(gamma)^2 + 2*C^2*cos(gamma)*sin(gamma) + I*C^2 + I*a^2 - I*b^2)*r)*sin(theta) + sqrt(-4*(2*C^2*cos(gamma)^2 - C^2)*r^2*cos(theta)^2 - C^4 + 2*C^2*a^2 - a^4 - b^4 - r^4 + 2*(C^2 + a^2)*b^2 + 2*(2*C^2*cos(gamma)^2 - 3*C^2 + a^2 + b^2)*r^2 + 4*(C*r^3*cos(gamma) + (C^3 - C*a^2 - C*b^2)*r*cos(gamma))*cos(theta) - 4*(2*C^2*r^2*cos(gamma)*cos(theta)*sin(gamma) - C*r^3*sin(gamma) - (C^3 - C*a^2 - C*b^2)*r*sin(gamma))*sin(theta))*(I*C*cos(gamma) - I*r*cos(theta) - C*sin(gamma) + r*sin(theta)))/(2*C*r*cos(gamma)*cos(theta) + 2*C*r*sin(gamma)*sin(theta) - C^2 - r^2)
</details>

<details>
<summary>Second solution</summary>
1/2*r*cos(theta) + 1/2*I*r*sin(theta) + 1/4*(2*(C*cos(gamma) - I*C*sin(gamma))*r^2*cos(theta)^2 - (C*cos(gamma) - I*C*sin(gamma))*r^2 - (C^3 + C*a^2 - C*b^2)*cos(gamma) - (r^3 - (2*C^2*cos(gamma)^2 + 2*I*C^2*cos(gamma)*sin(gamma) - C^2 + a^2 - b^2)*r)*cos(theta) - (I*C^3 + I*C*a^2 - I*C*b^2)*sin(gamma) - (2*(-I*C*cos(gamma) - C*sin(gamma))*r^2*cos(theta) + I*r^3 + (2*I*C^2*cos(gamma)^2 - 2*C^2*cos(gamma)*sin(gamma) - I*C^2 - I*a^2 + I*b^2)*r)*sin(theta) + sqrt(-4*(2*C^2*cos(gamma)^2 - C^2)*r^2*cos(theta)^2 - C^4 + 2*C^2*a^2 - a^4 - b^4 - r^4 + 2*(C^2 + a^2)*b^2 + 2*(2*C^2*cos(gamma)^2 - 3*C^2 + a^2 + b^2)*r^2 + 4*(C*r^3*cos(gamma) + (C^3 - C*a^2 - C*b^2)*r*cos(gamma))*cos(theta) - 4*(2*C^2*r^2*cos(gamma)*cos(theta)*sin(gamma) - C*r^3*sin(gamma) - (C^3 - C*a^2 - C*b^2)*r*sin(gamma))*sin(theta))*(-I*C*cos(gamma) + I*r*cos(theta) + C*sin(gamma) - r*sin(theta)))/(2*C*r*cos(gamma)*cos(theta) + 2*C*r*sin(gamma)*sin(theta) - C^2 - r^2)
</details>

(The symbol "I" in the equations above stand for the imaginary number)

With that, we can throw some numbers and see how the trajectories look like. For example, here's a few plots for the first solution:

![First Solution Plot](/assets/images/2023/2023-05-05-elliptical/plot1.svg)
![First Solution Plot](/assets/images/2023/2023-05-05-elliptical/plot2.svg)

They look round, but definitely not elliptical. The second solution is a bit better except for the first one:

![Second Solution Plot](/assets/images/2023/2023-05-05-elliptical/plot3.svg)
![Second Solution Plot](/assets/images/2023/2023-05-05-elliptical/plot4.svg)
![Second Solution Plot](/assets/images/2023/2023-05-05-elliptical/plot5.svg)

From this last set of solutions, it becomes clear that the larger the parameter $b$ is, the more elliptical the trajectory becomes. In fact, if we make $b$ infinitely larger