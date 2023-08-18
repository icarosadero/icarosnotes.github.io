---
layout: post
title: "Nernst Potential"
description: "Derivating the Nernst Potential from Fundamental Principles of Statistical Mechanics"
#image: assets/images/pic01.jpg
---

The Nernst Potential is a fundamental concept for the understanding of the electrical properties of biological membranes. It stands for the potential difference caused by different ionic concentrations inside and outside a membrane. Some neuronal models use the Nernst Potential to model the dynamics equilibrium of the flow of several species of ions through the membrane {% cite book:neuron_models %}. 

In the case of a single species of charge $q$, the potential difference across the membrane $\Delta V$ at temperature $T$ and particle densities $n_1$ and $n_2$ respectively inside and outside the cell is given by:

$$\Delta V = k_B\frac{T}{q}\log\left(\frac{n_1}{n_2}\right)$$

Our goal is to reach this expression starting from first principles of statistical mechanics.

## Model Assumptions

Our model will assume that the membrane separate a system of $N$ particles of charge $q$ that are kept under constant temperature $T$ in a heat bath. The exact shape of this boundary is assumed to be unimportant. The number of particles is kept constant.

{: refdef: style="text-align: center;"}
|![Membrane Model]({{ site.baseurl }}/assets/images/2023/2023-08-17-nernst-potential/membrane.svg){: width="30%"}|
|:--:|
|*The model assumes that the membrane separates the system into two regions $\Omega$ and $\Sigma$ with different concentration of particles.*|
{: refdef}

The Classical Hamiltonian for a single particle $j$ inside the membrane is given by $H_j$:

$$H_j = \frac{p_j^2}{2m} + q\sum_{i\neq j}^{N}V_{ji}(\left|\vec{x}_j - \vec{x}_i\right|)$$

Where $p_j$ is the momentum of the particle, $m$ is its mass and $V_{ji}$ is the potential energy of the particle at position $x_j$ caused by all other $N-1$ particles around it. Our next approximation will be to assume that our system have an enormous amount of particles $N>>1$, and that the temperature is high enough so that their motion is akin to a fluid. This will allow us to use the Continuum Approximation, setting potential energy of a particle $j$ at position $\vec{x}_j$ by the average potential energy of all particles around it:

$$\sum_{i \neq j}^{N}V_{ji}(\left|\vec{x}_j - \vec{x}_i\right|) \approx V(\vec{x}_j)$$

This will heavily simplify our calculations as we will now be able to treat this system as a gas of non-interacting particles, even though they do interact by an electric field! The Hamiltonian for a single particle $j$ is now given by:

$$H_j = \frac{p_j^2}{2m} + qV(\vec{x}_j)$$

## Probability and Partition Function

The assumptions allow us to model the problem by treating its possible microstates being drawn from a canonical ensemble. The probability distribution in this case is given by the Boltzmann distribution:

$$P(\vec{x}, \vec{p}) = \frac{1}{Z}e^{-\beta H(\vec{x}, \vec{p})}$$

Where $\beta = \frac{1}{k_BT}$ and $Z$ is the partition function:

$$Z = \sum_{\left\{\vec{x}, \vec{p}\right\}}e^{-\beta H(\vec{x}, \vec{p})}$$

In this notation, the vectors $\vec{x}$ and $\vec{p}$ represent the collection of all $N$ positions and momenta of the system, that is:

$$\vec{x} := \left(\vec{x}_1,...,\vec{x}_N\right)$$

$$\vec{p} := \left(\vec{p}_1,...,\vec{p}_N\right)$$

The total Hamiltonian is just the sum of all individual Hamiltonians:

$$H(\vec{x}, \vec{p}) = \sum_{j=1}^{N}H_j(\vec{x}_j, \vec{p}_j) = \sum_{j=1}^{N}\frac{p_j^2}{2m} + q\sum_{j=1}^{N}V(\vec{x}_j)$$

Plugging this into the expression for probability allows us to expand the sum into a product of exponentials:

$$P(\vec{x}, \vec{p}) = \frac{1}{Z}\prod_{j=1}^{N}e^{-\beta\frac{p_j^2}{2m}}e^{-\beta qV(\vec{x}_j)}$$

Since we're assuming to deal with non-interacting particles and looking at only the averaging behavior of the system, we can express the total probability as "copies" of the probability of a single particle, meaning that

$$P(\vec{x}, \vec{p}) = P_1(\vec{x}_1, \vec{p}_1)^N$$

Where $P_1$ is the probability of a single particle (chosen with $j=1$ for convenience):

$$P_1(\vec{x}_1, \vec{p}_1) := \frac{1}{Z_1}e^{-\beta\frac{p_1^2}{2m}}e^{-\beta qV(\vec{x}_1)}$$

$$Z_1 = \sum_{\left\{\vec{x_1}, \vec{p_1}\right\}}e^{-\beta\frac{p_1^2}{2m}}e^{-\beta qV(\vec{x}_1)}$$

## Derivation

Defining by $n(\vec{x}')$ the expected particle density at a position $\vec{x}'$ (a position vector with 3 components), we can compute this quantity in the following manner:

$$n(\vec{x}') = \left\langle\sum_{j=1}^{N}\delta(\vec{x}_j-\vec{x}')\right\rangle$$

The expected value of the dirac sum is calculated with the probability distribution of the system:

$$n(\vec{x}') = \left\langle\sum_{j=1}^{N}\delta(\vec{x}_j-\vec{x}')\right\rangle = \sum_{\left\{\vec{x},\vec{p}\right\}}\sum_{j=1}^{N}\delta(\vec{x}_j-\vec{x}')P(\vec{x}, \vec{p})$$

The delta function can now be computed by expanding the sum over $\left\\{\vec{x},\vec{p}\right\\}$ as an integral. To be pedantic, this would yield a $\frac{1}{\Delta \vec{x} \Delta \vec{p}}$ factor related to the uncertainty of the measure, which is replaced by Planck's constant as $\frac{1}{h}$; but since this would also show up on the integral of the partition function, they would cancel out. The expression then becomes:

$$ = \int\prod_{j=1}^{N}\mathrm{d}\vec{x}_j\mathrm{d}\vec{p}_j\sum_{k=1}^{N}\delta(\vec{x}_k-\vec{x}')P_j(\vec{x}_j, \vec{p}_j)$$

$$ = \sum_{k=1}^{N}\int\prod_{j=1}^{N}\mathrm{d}\vec{x}_j\mathrm{d}\vec{p}_j\delta(\vec{x}_k-\vec{x}')P_j(\vec{x}_j, \vec{p}_j)$$

By identifying $\int\mathrm{d}\vec{p}_j P_j(\vec{x_j},\vec{p_j})$ as just the probability $P_j(\vec{x_j})$, we can further simplify this as

$$ = \sum_{k=1}^{N}\int\prod_{j = 1}^{N}\mathrm{d}\vec{x}_j\delta(\vec{x}_k-\vec{x}')P_j(\vec{x}_j)$$

Since the delta function acts only on $\vec{x}_k$, we can integrate over it and get

$$ = \sum_{k=1}^{N}\int\prod_{j\neq k}^{N}\mathrm{d}\vec{x}_j P_k(\vec{x}')P_j(\vec{x}_j)$$

The remaining terms over the variables $\vec{x_j}$ with $j \neq k$ are just individual probabilities for each particle, whose sum must be unity. Thus, we get

$$n(\vec{x}') = \sum_{k=1}^{N} P_k(\vec{x}')$$

Just as before, we can replace the $N$ probabilities $P_j$ by $N$ copies of a single one $P_1$. From our previous definition, that is a factor proportional to $e^{-\beta q V(\vec{x}_1)}$ only since the momentum part is cancelled out by an identical term in the partition function $Z_1$. Then:

$$n(\vec{x}') = N\frac{e^{-\beta q V(\vec{x}')}}{\int\mathrm{d}\vec{x_1}e^{-\beta q V(\vec{x}'_1)}}$$

$$= N\alpha e^{-\beta q V(\vec{x}')}$$

Where the integral in the denominator got replaced by $\alpha$ for being just a scalar. If the system in question had a boundary dividing it into two regions with concentrations $n_1$ and $n_2$, we could then write the ratio between the two as:

$$\frac{n_1}{n_2} = e^{-\beta q (V_1 - V_2)}$$

Calling the difference in potential of the two regions $\Delta V$ and solving for it, we get:

$$\Delta V = \frac{1}{\beta q}\ln\left(\frac{n_1}{n_2}\right)$$

Which is the Nernst Potential with $\beta = \frac{1}{k_B T}$.

{% bibliography %}