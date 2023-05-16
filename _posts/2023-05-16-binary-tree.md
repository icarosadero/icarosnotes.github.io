---
layout: post
title: "Binary Tree as an Array"
description: "Index relationships of a binary tree as an array."
#image: assets/images/pic01.jpg
---

## What is a binary tree?

Binary trees, among many other trees, are data structures with a hierarchical ordering. They can be used to process incoming data in order of priority for example, where the most important data is processed first and not necessarily the one that arrived first.

From a mathematical viewpoint, trees are just graphs. Their vertices are the data itself and their edges are hierarchical relationships between them. These trees can be broken down into layers, each layer corresponding to a hierarchical level. The first layer has a single vertex standing for the most important one while subsequent vertices are distributed downwards to other layers. The specific case of a binary tree requires each vertex to have a degree between 2 and 3, except for the first one. This is to ensure that each vertex has at most two parent vertices. The following diagram shows a binary tree with 7 vertices and three layers:

{% mermaid %}
graph TD
    A[1] --> B[2]
    A[1] --> C[3]
    B[2] --> D[4]
    B[2] --> E[5]
    C[3] --> F[6]
    C[3] --> G[7]
{% endmermaid %}

So vertices 2 and 3 are less important than vertex 1 for example. If we start counting from zero, the total number of vertices of the nth layer is $2^{n}$

Another requirement of binary trees is that the value of the parent nodes is smaller or equal to the value of the child nodes. The opposite can also happen, in which case the tree is called a max binary tree, but it is clear that both cases are equivalent.

The most important operations related to binary trees are the insertion of a new vertex and the deletion of the most important one. New vertices are inserted at the end of the tree, in the last layer from left to right (or right to left depending on orientation). If the new vertex has a value that is smaller than its parent, it is swapped with it; an operation also known as "bubbling". This process is repeated until the new vertex is in the right place. In the worst-case scenario, this will happen until the node ends up at the first layer, meaning that the number of swaps will equal the number of layers ($l$). For a full binary tree, this number is simply $l = \log_{2}(m)$, where $m$ is the total number of vertices. In computer science jargon, this is the same to say that the insertion operation has a complexity of $\mathcal{O}(\log m)$. Notice that the base of the logarithm is unimportant since it only contributes as a constant factor.

As for the deletion of the most important vertex, it gets swapped with the one at the bottom of the tree and only then it gets removed. This maintains the whole structure of the tree but it doesn't necessarily keep the order of the vertices. To fix that a similar bubbling operation is performed downwards in the tree until the vertex is in the right place. Since we're only walking downwards instead or upwards, the complexity of this operation is still $\mathcal{O}(\log m)$.

