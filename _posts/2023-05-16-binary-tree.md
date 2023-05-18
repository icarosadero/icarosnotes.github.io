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

## Binary tree in an Array

Now that we have a quick overview of binary trees, let us concern ourselves with the implementation of this data structure. The most common way to do this is to define each vertex in the tree as a class with two attributes denoting the child vertices. In Python, it would look like this:

```python
class Node:
    def __init__(self, left=None, right=None):
        self.left = left
        self.right = right
```

Although there is nothing wrong with this representation, a more compact way would be to store each vertex as an element of a list. This is done by starting from the first layer and then filling up the array from left to right until the last layer. The array shows the same tree as in the previous example represented as an array indexed from 1 instead of zero:

```python
tree = [1, 2, 3, 4, 5, 6, 7]
```

So, as you can see, there are no surprises. Since the total number of nodes per layer is a power of 2, we can tell which layer a certain vertex belongs to by checking how many powers of two would fit in its corresponding index. That is, we look at the most significant bit of its binary representation. So, for example, index 6 has binary representation `0b110` with its most significant bit in the third place (from right to left), meaning that the vertex with this index is on the third layer. In general, index $j$ can be decomposed in the following form:

$$j = 2^{k_j-1} + r_j$$

Where $k_j$ stands for the kth layer, which is also the most significant bit of the representation with a unit offset, and $r_j$ is a remainder. Note that the remainder shows how many nodes precede that index in the same layer. Taking index 6 again, for example, its remainder would be `0b010`, meaning that there are two vertices before it in its layer.

If we wish to find the leftmost child of the vertex indexed by $j$, we can do so by noticing that each preceding vertex on the same layer will always have two children. So, by knowing how many indexes precede $j$ in the same layer, we can multiply that number by two to get the relative index of the child node $i$:

$$r_i = 2r_j$$

Using our previous definition of $j$, we can rewrite this as:

$$i - 2^{k_i-1} = 2(j - 2^{k_j-1})$$

Noting that $k_i = k_j + 1$ and rearranging the terms, we get:

$$i = 2j$$

For the rightmost child, we just add one.