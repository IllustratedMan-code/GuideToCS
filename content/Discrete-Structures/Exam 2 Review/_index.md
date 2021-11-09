+++
title = "Exam 2 review"
author = ["David Lewis"]
draft = false
+++

-   [All-Slides](/ox-hugo/combine2.pdf) after the first exam.
-   [All Topics](</ox-hugo/Topic Coverage for Test 2 CS2071 Fall 2021-1.pdf>)


## RSA Public Key Cryptosystem {#rsa-public-key-cryptosystem}


### Extended GCD to compute private key {#extended-gcd-to-compute-private-key}

-   \\(\varphi(n) = (p-1)(q-1)\\)
-   \\(se + t\varphi(n) = g = 1 = gcd(e, \varphi(n))\\)
-   \\(se \equiv 1(\mod \varphi (n))\\)
-   \\(s = e^{-1}(\mod \varphi(n))\\)


#### R implementation of GCD {#r-implementation-of-gcd}

This is an implementation of Eculid's recursive GCD algorithm. Should be easy to convert to python.

```R
euclid <- function(a, b) {
  print(c(a, b))
  if (b == 0) {
    return(a)
  }
  euclid(b, a %% b)
}
```


## Intro to Graph Theory, Euler's Degree Formula {#intro-to-graph-theory-euler-s-degree-formula}

-   A Graph is a series of vertices (nodes) that are connected by edges
-   Degree (in this class) is equal to the number of edges that a node is connected to
-   Complete graph is a graph where every node is connected to every other node.
-   A subgraph is a graph made from a subset of nodes in another graph
-   An induced subgraph must have the same edges that the parent graph had.


## Graph Isomorphism, Path, Coloring {#graph-isomorphism-path-coloring}


## Planar Graphs and Euler's Polyhedron Formula {#planar-graphs-and-euler-s-polyhedron-formula}


## Spanning Trees and Eulerian Circuits {#spanning-trees-and-eulerian-circuits}


## Hypercubes and hamiltonian Cycles {#hypercubes-and-hamiltonian-cycles}


## Implementation of Graphs and Digraphs {#implementation-of-graphs-and-digraphs}


## Digraphs {#digraphs}


## The Web Digraph and PageRank {#the-web-digraph-and-pagerank}


## Intro to Combinatorics and Counting {#intro-to-combinatorics-and-counting}


## Permutations and Combinations {#permutations-and-combinations}


## Identities, Binomial Theorem, Pascals Triangle {#identities-binomial-theorem-pascals-triangle}
