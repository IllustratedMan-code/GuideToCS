+++
title = "Discrete Structures"
author = ["David Lewis"]
draft = false
+++

Discrete Structures as taught by Ken Berman


## Set Theory {#set-theory}


### Sets {#sets}

unordered collection (group) of zero or more distinct objects

-   set theory (operations about sets)
-   S,T,U,A,B ... for sets
-   List elements in curly braces `{a, b, c}`
-   Sets are equal if and only if they contain the same elements.


#### Set Builder {#set-builder}

-   \\(\\{x:P(x)\\}\\), \\(\\{x|P(x)\\}\\).
-   The set of all x such that P(x)
-   {x: x is an integer where x>0 and x<5}


#### Set relations {#set-relations}

-   \\(\forall\\) for all
-   \\(\rightarrow\\) implies
-   \\(\leftrightarrow\\) if and only if
-   \\(\exists\\) exists
-   \\(\nexists\\) does not exist
-   \\(\wedge\\) and
-   \\(\vee\\) or
-   \\(x\in S\\) x in S
-   \\(x \notin S\\) x not in S


#### Empty set {#empty-set}

-   \\(\varnothing = \\{\\}\\)


#### Subset and superset {#subset-and-superset}

-   \\(S\subseteq T\\) subset
-   \\(S \supseteq T\\) superset
-   \\(S\subset T\\) proper set
-   \\(S \supset T\\) proper superset


#### Cardinality {#cardinality}

-   \\(|S|\\) Cardinality of S or the number of elements in S


#### Universal Set {#universal-set}

-   \\(U\\) is the set containing all other sets (in the problem)
-   universe of discorse


#### Union {#union}

-   \\(\\{a,b,c\\} \cup \\{c,e\\} = \\{a,b,c,e\\}\\)


#### Intersection {#intersection}

-   \\(\\{a,b,c\\} \cap \\{c,e\\} = \\{c\\}\\)


#### Disjointedness {#disjointedness}

\\(A \cap B = \varnothing\\)


#### Set difference {#set-difference}

-   \\(A - B\\)
-   \\(\\{a,b,c\\} - \\{c,e\\} = \\{a, b\\}\\)
-   Set of all elements in A but not B
-   Compliment with universal set


#### Compliment {#compliment}

-   \\(\bar A = U - A\\)


#### Symmetric difference {#symmetric-difference}

-   \\(A \bigoplus B = A \cup B - A \cap B\\)


#### Cartesian product {#cartesian-product}

-   \\(A \times B = \\{(a,b) | a \in A \text{\\: and \\:} b \in B\\}\\)
-   \\(|A| \times |B| = |A \times B|\\)


#### Generalized Union and Intersection {#generalized-union-and-intersection}

Union or intersection of many sets.


## Standard Proof techniques {#standard-proof-techniques}


### Disproof by Counterexample {#disproof-by-counterexample}

Shows that a conjecture is not true by pointing out an example where the conjecture does not hold.

-   No nickels
-   1 quarter + 5 pennies
-   3 dimes
-   Greedy method is not appropriate with limited change


### Proof by Contradiction {#proof-by-contradiction}

Proof that the opposite cannot be true.


#### Square root of 2 is irrational {#square-root-of-2-is-irrational}

-   \\(\sqrt 2 = a/b\\)
-   \\(a/b\\) is simplified
-   a or b or both must be odd (otherwise could be simplified)
-   \\(2 = a^2/b^2\\)
-   \\(a^2 = 2 \*\* b^2\\)
-   \\(a^2\\) must be even (2 times any number is even)
-   \\(a\\) is even as well (odd times odd is odd)
-   \\(a = 2 \*\* k\\) where k is a / 2
-   \\(2 = (2 \*\* k)^2/b^2 \rightarrow b^2 = 2k^2\\)
-   \\(b\\) is also odd by this method
-   \\(a\\) and \\(b\\) cannot be odd
-   \\(\sqrt 2\\) cannot be rational


## Trees {#trees}

-   set of nodes
-   first node is root
-   every other node has a "parent" node


### Two Trees {#two-trees}

-   Every node that is not a leaf has 2 child nodes


### Binary Trees {#binary-trees}

-   Every node has a maximum of 2 children


## Logic {#logic}


### Boolean operators {#Logic}

| Negation       | NOT     | Unary  | \\(\neg\\)            |
|----------------|---------|--------|-----------------------|
| Conjunction    | AND     | Binary | \\(\wedge\\)          |
| Disjunction    | OR      | Binary | \\(\vee\\)            |
| Exclusive OR   | XOR     | Binary | \\(\bigoplus\\)       |
| Implication    | IMPLIES | Binary | \\(\rightarrow\\)     |
| Bi-conditional | IFF     | Binary | \\(\leftrightarrow\\) |


### Negation {#negation}

| p | \\(\neg p\\) |
|---|--------------|
| T | F            |
| F | T            |


### Conjunction {#conjunction}

| p | q | \\(p \wedge q\\) |
|---|---|------------------|
| F | F | F                |
| F | T | F                |
| T | F | F                |
| T | T | T                |


### Disjunction {#disjunction}

| p | q | \\(p \vee q\\) |
|---|---|----------------|
| F | F | F              |
| F | T | T              |
| T | F | T              |
| T | T | T              |


### Exclusive Or {#exclusive-or}

| p | q | \\(p \bigoplus q\\) |
|---|---|---------------------|
| F | F | F                   |
| F | T | T                   |
| T | F | T                   |
| T | T | F                   |


### Implication {#implication}

| p | q | \\(p \rightarrow q\\) |
|---|---|-----------------------|
| F | F | T                     |
| F | T | T                     |
| T | F | F                     |
| T | T | T                     |


### Bi-conditional {#bi-conditional}

| p | q | \\(p \leftrightarrow q\\) |
|---|---|---------------------------|
| F | F | T                         |
| F | T | F                         |
| T | F | F                         |
| T | T | T                         |


## Normal forms {#normal-forms}


### Disjunctive Normal Form (DNF) {#disjunctive-normal-form--dnf}

| p | q | r | \\(f\\) | Clause Conjunction                     |
|---|---|---|---------|----------------------------------------|
| F | F | F | T       | \\(\neg p \wedge \neg q \vee \neg r\\) |
| F | F | T | F       |                                        |
| F | T | F | T       | \\(\neg p \wedge \neg q \wedge r\\)    |
| F | T | T | T       | \\(\neg p \wedge q \wedge r\\)         |
| T | F | F | F       |                                        |
| T | F | T | F       |                                        |
| T | T | F | T       | \\(p \wedge q \wedge \neg r\\)         |
| T | T | T | T       | \\(p \wedge q \wedge r\\)              |

-   Take all of the true statements in the table and write a clause for them
-   Concatenate all of the true clauses together with a disjunction statement \\(\vee\\)
-   \\(\neg f \Leftrightarrow (\neg p \wedge \neg q \wedge \neg r) \vee (\neg p \wedge q \wedge \neg r) \vee ( \neg p \wedge q \wedge r) \vee (p \wedge q \wedge r) \vee (p \wedge q \wedge \neg r) \vee (p \wedge q \wedge r)\\)


### Conjunctive Normal Form (CNF) {#conjunctive-normal-form--cnf}

-   Negate the DNF form
-   \\(\neg (\neg f) \Leftrightarrow f\\)
-   Use demorgans law to distribute


### Expression Trees {#expression-trees}

A binary tree representation of the logical expression

{{< figure src="/ox-hugo/expressionTree.png" width="200px" >}}


## Set relations {#set-relations}


### reflexive {#reflexive}

reflexive if, for every element \\(a \in A\\) we have \\(aRa \Rightarrow (a, a) \in R\\)

-   \\( A = \\{(a, a): a \in A\\}\\)


### Symmetric {#symmetric}

symmetric iff \\((x,y) \in R \wedge (y,x) \in R\\)


### Transitive {#transitive}

Iff R relates \\(a\\) to \\(b\\) and \\(b\\) to \\( c\\) then \\(a \\) relates to \\(c\\)

-   \\(a < b < c \rightarrow a < c\\)
-   \\(a = b = c \rightarrow a = c\\)


## Modular arithmetic {#modular-arithmetic}

-   \\(x \equiv y (\text{mod} \\: n) \leftrightarrow (x-y) \\: \text {mod} \\: n = 0\\)


### Addition Tables {#addition-tables}

-   Z mod 4

    | + | 0                        | 1 | 2 | 3 |
    |---|--------------------------|---|---|---|
    | 0 | \\((0 + 0) \mod 4 = 0\\) | 1 | 2 | 3 |
    | 1 | \\((1 + 0) \mod 4 = 1\\) | 2 | 3 | 0 |
    | 2 | \\((2 + 0) \mod 4 = 1\\) | 3 | 0 | 1 |
    | 3 | \\((3 + 0) \mod 4 = 3\\) | 0 | 1 | 2 |


### Multiplication tables {#multiplication-tables}

-   Z mod 4

    | x | 0                            | 1 | 2 | 3 |
    |---|------------------------------|---|---|---|
    | 0 | \\((0 \cdot 0) \mod 4 = 0\\) | 0 | 0 | 0 |
    | 1 | \\((1 \cdot 0) \mod 4 = 0\\) | 1 | 2 | 3 |
    | 2 | \\((2 \cdot 0) \mod 4 = 0\\) | 2 | 0 | 2 |
    | 3 | \\((3 \cdot 0) \mod 4 = 0\\) | 3 | 2 | 1 |


## Exam 1 review {#exam-1-review}

[All-Slides](/ox-hugo/combine.pdf)


### Set Theory {#set-theory}


#### Union {#union}

-   \\(S = A \cup B\\)

| \\(A\\) | \\(B\\) | \\(A \cup B\\) |
|---------|---------|----------------|
| T       | T       | T              |
| T       | F       | T              |
| F       | T       | T              |
| F       | F       | F              |


#### Intersection {#intersection}

-   \\(S = A \cap B\\)

| \\(A\\) | \\(B\\) | \\(A \cup B\\) |
|---------|---------|----------------|
| T       | T       | T              |
| T       | F       | F              |
| F       | T       | F              |
| F       | F       | F              |


#### Difference {#difference}

-   \\(S = A - B\\)

| \\(A\\) | \\(B\\) | \\(A \cup B\\) |
|---------|---------|----------------|
| T       | T       | T              |
| T       | F       | T              |
| F       | T       | T              |
| F       | F       | F              |


#### Symmetric difference {#symmetric-difference}

-   \\(S = A \bigoplus B\\)
-   \\((a \in S \iff (a \in A \quad \text{and} \quad a \ni B)\\)

| \\(A\\) | \\(B\\) | \\(A \cup B\\) |
|---------|---------|----------------|
| T       | T       | F              |
| T       | F       | T              |
| F       | T       | T              |
| F       | F       | F              |


#### Demorgans law {#demorgans-law}

\\(\neg (A \cup B) = \neg A \cap \neg B\\)


#### Principle of Inclusion-Exclusion {#principle-of-inclusion-exclusion}

\\(|A \cup B \cup C| = |A| + |B| + |C| - |A \cap B| - |A \cap C| - |B \cap C| + |A \cap B \cap C|\\)


### Proof Techniques {#proof-techniques}

-   Counterexample
-   Contradiction
-   Induction
-   Trees


#### Trees {#trees}

-   n nodes
-   n-1 edges
-   leaf nodes = intermediate nodes + 1
-   Total nodes = intermediate nodes + leaf nodes


### power sets {#power-sets}

-   \\(A= \\{a, b, c\\}\\)
-   \\(P(A) = \varnothing , \\{a\\}, \\{b\\}, \\{c\\}, \\{a, b\\}, \\{a, c\\}, \\{b, c\\}, \\{a, b, c\\}\\)
-   \\(|P(A)| = 2^{|A|} = 2^3 = 8\\)


### Propositional logic {#propositional-logic}

-   All F = contradiction
-   All T = Tautology
-   CNF conjunction of all disjunction clauses, unsatisfiable when all combinations of clauses are present
-   DNF disjunction of all conjunction clauses
-   [Logic](https://illustratedman-code.github.io/GuideToCS/discrete-structures/logic/)


#### NP and NP-completeness {#np-and-np-completeness}

-   P = problem that can be solved in polynomial time
-   NP = non-deterministic polynomial (unknown if it can be solved in polynomial time)
-   NP-complete = any NP problem A can be reduced to problem B


### Functions and relations {#functions-and-relations}

-   One to one -> (injective)
-   Onto () -> surjective
-   One to one and Onto -> Bijective
-   Density
-   Equivalence relations
    -   Reflexive, \\(a, a \in R \\: \text{for every a in A}\\)
    -   Symmetric, \\((b, a \in R\\: \text{ whenver} \\:  a, b \in R\\)
    -   Transitive, \\((a, b) \in R \text{ and } (b, c) \in R \text{ then } (a, c) \in R \text{ where } a, b, c \in A \\)
-   Asymmetric, \\((a, b) \in R \text{ implies } (b, a) \not\in R\\)
-   AntiSymmetric, assymetric except for the case \\((a, b) \in R \rightarrow (b, a) \in R\\) where \\(b\\) is equal to \\(a\\)
-   Poset (partially ordered set)
    -   reflexive
    -   Antisymmetric
    -   Transitive


### Mod Arithmetic {#mod-arithmetic}

-   \\((x + y) \mod k = (x \mod k \quad + \quad y \mod k) \mod k \\)
-   \\(b^{n-1} = 1 \mod n \\)


## Exam 2 review {#exam-2-review}

-   [All-Slides](/ox-hugo/combine2.pdf) after the first exam.
-   [All Topics](</ox-hugo/Topic Coverage for Test 2 CS2071 Fall 2021-1.pdf>) most formulas are in this one.


### RSA Public Key Cryptosystem {#rsa-public-key-cryptosystem}


#### Extended GCD to compute private key {#extended-gcd-to-compute-private-key}

-   \\(\varphi(n) = (p-1)(q-1)\\)
-   \\(se + t\varphi(n) = g = 1 = gcd(e, \varphi(n))\\)
-   \\(se \equiv 1(\mod \varphi (n))\\)
-   \\(s = e^{-1}(\mod \varphi(n))\\)

<!--list-separator-->

-  R implementation of GCD

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


### Intro to Graph Theory, Euler's Degree Formula {#intro-to-graph-theory-euler-s-degree-formula}

-   A Graph is a series of vertices (nodes) that are connected by edges
-   Degree (in this class) is equal to the number of edges that a node is connected to
-   Complete graph is a graph where every node is connected to every other node.
-   A subgraph is a graph made from a subset of nodes in another graph
-   An induced subgraph must have the same edges that the parent graph had.


### Graph Isomorphism, Path, Coloring {#graph-isomorphism-path-coloring}

-   Isomorphic graphs are identical except for node position, connections are the same
-   nodes in colored Graphs are colored to be different than all of the adjacent nodes.
-   A path is a sequence of vertices connected by edges within a graph. Vertices may be repeated. A path is the same as a trail.
-   Simple paths are paths where vertices are not repeated.


### Planar Graphs and Euler's Polyhedron Formula {#planar-graphs-and-euler-s-polyhedron-formula}

-   [Supplemental Notes For Planar Graph (Kuratowski)](/ox-hugo/SupplementalNotesPlanarGraphs.pdf)
-   Planar graphs are graphs that can be represented isomorphically without any overlapping edges.
-   \\(\sum\_{g \in F}\deg(g) = 2m\\) where g is a vertex in face F, and m is the number of edges
-   5 regular polyhedra
    1.  Tetrahedron
    2.  Cube
    3.  Dodecahedron
    4.  Icosahedron
    5.  Octahedron


### Spanning Trees and Eulerian Circuits {#spanning-trees-and-eulerian-circuits}

-   Eulerian path contains all edges in a graph exactly once
-   Eulerian circuit is a circuit that contains all edges exactly once.
-   Simple path that contains every vertex in the graph is a Hamiltonian Path
-   Hamiltonian cycle is a cycle that contains every vertex in the path


### Hypercubes and hamiltonian Cycles {#hypercubes-and-hamiltonian-cycles}


### Implementation of Graphs and Digraphs {#implementation-of-graphs-and-digraphs}


### Digraphs {#digraphs}


### The Web Digraph and PageRank {#the-web-digraph-and-pagerank}


### Intro to Combinatorics and Counting {#intro-to-combinatorics-and-counting}


### Permutations and Combinations {#permutations-and-combinations}


### Identities, Binomial Theorem, Pascals Triangle {#identities-binomial-theorem-pascals-triangle}


## Exam 3 review {#exam-3-review}

[Link to all Slides](/ox-hugo/combine3.pdf)
