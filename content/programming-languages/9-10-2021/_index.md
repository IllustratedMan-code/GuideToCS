+++
title = "9/10/2021"
author = ["David Lewis"]
draft = false
+++

In today's edition of the Daily PL we will recap our discussion from today that covered expressions, order of evaluation, short-circuit evaluation and referential transparency.


## Expressions {#expressions}

An _expression_ is the means of specifying computations in a programming language. Informally, it is anything that yields a value. For example,

-   `5` is an expression (value 5)
-   `5 + 2` is an expression (value 7)
-   Assuming `fun` is a function that returns a value, `fun()` is an expression (value is the return value)
-   Assuming `f` is a variable, `f` is an expression (the value is the value of the variable)

Certain languages allow more exotic statements to be expressions. For example, in C/C++, the `=` operator yields a value (the value of the expression on the right operand). It is this choice by the language designer that allows a C/C++ programmer to write

```c++
int a, b, c, d;
a = b = c = d = 5;
```

to initialize all four variables to 5.

When we discuss functional programming languages, we will see how many more things are expressions that programmers typically think are simply statements.


## Order of Evaluation {#order-of-evaluation}

Programmers learn the associativity and precedence of operations in their languages. That knowledge enables them to mentally calculate the value of statements like 5 + 4 \* 3 / 2.

What programmers often forget to learn about their language, is the order of evaluation of operands. Take several of those constants from the previous expression and replace them with variables and function calls:

```c++
5 + a() * c / b()
```

The questions abound:

-   Is a() executed before the value of variable c is retrieved?
-   Is b() executed before c()?
-   Is b() executed at all?

In a language with _functional_ side effects, the answer to these questions matter. Why? Consider that a could have a side effect that changes c. If the value of c is retrieved _before_ the execution of a() then the expression will evaluate to a certain value and if the value of c is retrieved after execution of a() then the expression will evaluate to a different value.

Certain languages define the order of evaluation of operands (Python, Java) and others do not (C/C++). There are reasons why defining the order is a good thing:

-   The programmer can depend on that order and benefit from the consistency
-   The program's readability is improved.
-   The program's reliability is improved.

But there is at least one really good reason for not defining that order: optimizations. If the compiler/interpreter can move around the order of evaluation of those operands, it may be able to find a way to generate faster code!


## Short-circuit Evaluation {#short-circuit-evaluation}

Languages with _short-circuit evaluation_ take these potential optimizations one step further. For a boolean expression, the compiler will stop evaluating the expression as soon as the result is fixed. For instance, in `a() && b()`, if `a()` is `false`, then the entire statement will always be false, no matter the value of `b()`. In this case, the compiler/interpreter will simply not execute `b()`. On the other hand, in `a() || b()` if `a()` is true, then the entire statement will always be true, no matter the value of `b()`. In this case, the compiler/interpreter will simply not execute `b()`.

A programmer's reliance on this type of behavior in a programming language is very common. For instance, this is a common idiom in C/C++:

```c++
int *variable = nullptr;

...

if (variable != nullptr && *variable > 5) {
  ...
}
```

In this code, the programmer is checking to see whether there is memory allocated to variable before they attempt to read that memory. This is defensive programming thanks to short-circuit evaluation.


## Referential Transparency {#referential-transparency}

Most of these issues would not be a problem if programmer's wrote functions that did not have side effects (remember that those are called pure functions). There are languages that will not allow side effects and those languages support referential transparency: A function has referential transparency if its value (its output) depends only on the value of its parameter(s). In other words, if given the same inputs, a referentially transparent function always gives the same output.


## Put It All Together {#put-it-all-together}

Try you hand at the practice quiz Expressions, precedence, associativity and coercions to check your understanding of the material we covered in class on Friday and the material from your assigned reading! For the why, check out [relational.cpp](https://github.com/hawkinsw/cs3003/blob/main/expressions/relational.cpp) .
