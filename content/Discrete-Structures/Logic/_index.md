+++
title = "Logic"
author = ["David Lewis"]
draft = false
+++

## Boolean operators {#Logic}

| Negation       | NOT     | Unary  | \\(\neg\\)            |
|----------------|---------|--------|-----------------------|
| Conjunction    | AND     | Binary | \\(\wedge\\)          |
| Disjunction    | OR      | Binary | \\(\vee\\)            |
| Exclusive OR   | XOR     | Binary | \\(\bigoplus\\)       |
| Implication    | IMPLIES | Binary | \\(\rightarrow\\)     |
| Bi-conditional | IFF     | Binary | \\(\leftrightarrow\\) |


## Negation {#negation}

| p | \\(\neg p\\) |
|---|--------------|
| T | F            |
| F | T            |


## Conjunction {#conjunction}

| p | q | \\(p \wedge q\\) |
|---|---|------------------|
| F | F | F                |
| F | T | F                |
| T | F | F                |
| T | T | T                |


## Disjunction {#disjunction}

| p | q | \\(p \vee q\\) |
|---|---|----------------|
| F | F | F              |
| F | T | T              |
| T | F | T              |
| T | T | T              |


## Exclusive Or {#exclusive-or}

| p | q | \\(p \bigoplus q\\) |
|---|---|---------------------|
| F | F | F                   |
| F | T | T                   |
| T | F | T                   |
| T | T | F                   |


## Implication {#implication}

| p | q | \\(p \rightarrow q\\) |
|---|---|-----------------------|
| F | F | T                     |
| F | T | T                     |
| T | F | F                     |
| T | T | T                     |


## Bi-conditional {#bi-conditional}

| p | q | \\(p \leftrightarrow q\\) |
|---|---|---------------------------|
| F | F | T                         |
| F | T | F                         |
| T | F | F                         |
| T | T | T                         |
