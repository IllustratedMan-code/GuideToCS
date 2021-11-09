+++
title = "Exam 1 review"
author = ["David Lewis"]
draft = false
+++

[All-Slides](/ox-hugo/combine.pdf)


## Set Theory {#set-theory}


### Union {#union}

-   \\(S = A \cup B\\)

| \\(A\\) | \\(B\\) | \\(A \cup B\\) |
|---------|---------|----------------|
| T       | T       | T              |
| T       | F       | T              |
| F       | T       | T              |
| F       | F       | F              |


### Intersection {#intersection}

-   \\(S = A \cap B\\)

| \\(A\\) | \\(B\\) | \\(A \cup B\\) |
|---------|---------|----------------|
| T       | T       | T              |
| T       | F       | F              |
| F       | T       | F              |
| F       | F       | F              |


### Difference {#difference}

-   \\(S = A - B\\)

| \\(A\\) | \\(B\\) | \\(A \cup B\\) |
|---------|---------|----------------|
| T       | T       | T              |
| T       | F       | T              |
| F       | T       | T              |
| F       | F       | F              |


### Symmetric difference {#symmetric-difference}

-   \\(S = A \bigoplus B\\)
-   \\((a \in S \iff (a \in A \quad \text{and} \quad a \ni B)\\)

| \\(A\\) | \\(B\\) | \\(A \cup B\\) |
|---------|---------|----------------|
| T       | T       | F              |
| T       | F       | T              |
| F       | T       | T              |
| F       | F       | F              |


### Demorgans law {#demorgans-law}

\\(\neg (A \cup B) = \neg A \cap \neg B\\)


### Principle of Inclusion-Exclusion {#principle-of-inclusion-exclusion}

\\(|A \cup B \cup C| = |A| + |B| + |C| - |A \cap B| - |A \cap C| - |B \cap C| + |A \cap B \cap C|\\)


## Proof Techniques {#proof-techniques}

-   Counterexample
-   Contradiction
-   Induction
-   Trees


### Trees {#trees}

-   n nodes
-   n-1 edges
-   leaf nodes = intermediate nodes + 1
-   Total nodes = intermediate nodes + leaf nodes


## power sets {#power-sets}

-   \\(A= \\{a, b, c\\}\\)
-   \\(P(A) = \varnothing , \\{a\\}, \\{b\\}, \\{c\\}, \\{a, b\\}, \\{a, c\\}, \\{b, c\\}, \\{a, b, c\\}\\)
-   \\(|P(A)| = 2^{|A|} = 2^3 = 8\\)


## Propositional logic {#propositional-logic}

-   All F = contradiction
-   All T = Tautology
-   CNF conjunction of all disjunction clauses, unsatisfiable when all combinations of clauses are present
-   DNF disjunction of all conjunction clauses
-   [Logic](https://illustratedman-code.github.io/GuideToCS/discrete-structures/logic/)


### NP and NP-completeness {#np-and-np-completeness}

-   P = problem that can be solved in polynomial time
-   NP = non-deterministic polynomial (unknown if it can be solved in polynomial time)
-   NP-complete = any NP problem A can be reduced to problem B


## Functions and relations {#functions-and-relations}

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


## Mod Arithmetic {#mod-arithmetic}

-   \\((x + y) \mod k = (x \mod k \quad + \quad y \mod k) \mod k \\)
-   \\(b^{n-1} = 1 \mod n \\)
