+++
title = "10/22/2021"
author = ["David Lewis"]
draft = false
+++

## Corrections {#corrections}

Thanks to Donald's persistence, I researched the mechanism by which Haskell and other pure functional languages

1.  handle associations between names and expressions, and
2.  pass around infinite lists (without having to generate the entire list first -- an obvious impossibility)

thunks are covered below!


## Function Invocation in Functional Programming Languages {#function-invocation-in-functional-programming-languages}

In imperative programming languages, it may matter to the correctness of a program the order in which parameters to a function are evaluated. (Note: For the purposes of this discussion we will assume that all operators [+, -, /, etc] are implemented as functions that take the operands as arguments in order to simplify the discussion. In other words, when describe the order of function evaluation we are also talking about the order of operand evaluation.) While the choice of the order in which we evaluate the operands is the language designer's prerogative, the choice has consequences. Why? Because of side effects! For example:

```c
#include <stdio.h>

int operation(int parameter) {
  static int divisor = 1;
  return parameter / (divisor++);
}

int main() {
  int result = operation(5) + operation(2);
  printf("result: %d\n", result);
  return 0;
}
```

prints

```nil
result: 6
```

whereas

```c
#include <stdio.h>

int operation(int parameter) {
  static int divisor = 1;
  return parameter / (divisor++);
}

int main() {
  int result = operation(2) + operation(5);
  printf("result: %d\n", result);
  return 0;
}
```

prints

```nil
result: 4
```

In the difference between the two programs we see vividly the role that the static variable plays in the state of the program and its ultimate output.

Because of the referential transparency in pure functional programming languages, the designer of such a language does not need to worry about the consequences of the decision about the order of evaluation of arguments to functions. However, that does not mean that the language designer of a pure functional programming language does not have choices to make in this area.

A very important choice the designer has to make is the time when function arguments are evaluated. There are two options available:

1.  All function arguments are evaluated before the function is evaluated.
2.  Function arguments are evaluated only when their results are needed.

Let's look at an example: Assume that there are two functions: dbl, a function that doubles its input, and average, a function that averages its three parameters:

```haskell
dbl x = (+) x x
average a b c = (/) ((+) a ((+) b c)) 3
```

Both functions are written using prefix notation (i.e., (<operator> <operand1> ... <operandn>). We will call these functions like this:

```haskell
dbl (average 3 4 5)
```

If the language designer chooses to evaluate function arguments only when their results are needed, the execution of this function call proceeds as follows:

```haskell
dbl (average 3 4 5)
+ (average 3 4 5) (average 3 4 5)
+ ((/) ((+) 3 ((+) 4 5)) 3) (average 3 4 5)
+ (4) (average 3 4 5)
+ (4) ((/) ((+) 3 ((+) 4 5)) 3)
+ (4) (4)
8
```

The outermost function is always reduced (expand) before the inner functions. Note: Primitive functions (+, and / in this example) cannot be expanded further so we move inward in evaluation if we encounter such a function for reduction.

If, however, the language designer chooses to evaluate function arguments before the function is evaluated, the execution of the function call proceeds as follows:

```haskell
dbl (average 3 4 5)
dbl ((/) ((+) 3 ((+) 4 5)) 3)
dbl 4
+ 4 4
8
```

No matter the designer's choice, the outcome of the evaluation is the same. However, there is something strikingly different about the two. Notice that in the first derivation, the calculation of the average of the three numbers happens twice. In the second derivation, it happens only once! That efficiency is not a fluke! Generally speaking, the method of function invocation where arguments are evaluated before the function is evaluated is faster.

These two techniques have technical names:

1.  _applicative order_:  "all the arguments to … procedures are evaluated when the procedure is applied."
2.  _normal order_: "delay evaluation of procedure arguments until the actual argument values are needed."

These definitions come from

[Abelson, H., Sussman, G. J.,, with Julie Sussman (1996). Structure and Interpretation of Computer Programs. Cambridge: MIT Press/McGraw-Hill. ISBN: 0-262-01153-0](http://uclid.uc.edu/record=b2528617~S39)

It is obvious, then, that any serious language designer would choose applicative order for their language. There's no reason redeeming value for the inefficiency of normal order.
The Implications of Applicative Order

Scheme is a [Lisp dialect](https://en.wikipedia.org/wiki/Lisp%5F(programming%5Flanguage)#Major%5Fdialects) . I told you that we weren't going to work much with Lisp, but I lied. Sort of. Scheme is an applicative-order language with the same list-is-everything syntax as all other Lisps (see [The Daily PL - 10/15/2021](https://uc.instructure.com/courses/1476336/pages/the-daily-pl-10-slash-15-slash-2021)). In Scheme, you would define an if function named `myif` like this:

```lisp
(define (myif c t f) (cond (c t) (else f)))
```

c is a boolean and myif returns t when c is true and f when c is false. No surprises.

We can define a name a and set its value to 5:

```lisp
(define a 5)
```

Now, let's call myif:

```lisp
(myif (= a 0) 1 (/ 1 a))
```

If a is equal to 0, then the call returns 1. Perfect. If a is not zero, the call returns the reciprocal of a. Given the value of a, the result is 1/7.

Let's define the name b and set its value to 0:

```lisp
(define b 0)
```

Now, let's call myif:

```lisp
(myif (= b 0) 1 (/ 1 b))
```

If b is equal to 0, then the call returns 1. If b is not zero, the call returns the reciprocal of b. Given the value of b, the result is 1:

```nil
/: division by zero
  context...:
   "/home/hawkinsw/code/uc/cs3003/scheme/applicative/applicative.rkt": [running body]
   temp37_0
   for-loop
   run-module-instance!125
   perform-require!78
```

That looks exactly like 1. What happened?

Remember we said that the language is applicative order. No matter what the value of b, both of the arguments are going to be evaluated before myif starts. Therefore, Scheme attempts to evaluate 1 / b which is 1 / 0 which is division by zero.

Thanks to situations like this, the Scheme programming language is forced into defining special semantics for certain functions, like the built-in if expression. As a result, function invocation is not orthogonal in Scheme -- the general rules of function evaluation in Scheme must make an exception for applying functions like the built-in if expression. Remember that the orthogonality decreases as exceptions in a language's specification increase.
Sidebar: Solving the problem in Scheme

Feel free to skip this section if you are not interested in details of the Scheme programming language. That said, the concepts in this section are applicable to other languages.

In Scheme, you can specify that the evaluation of an expression be delayed until it is forced.

```lisp
(define d (delay (/ 1 7)))
```

defines d to be the eventual result of the evaluation of the division of 1 by 7. If we ask Scheme to print out d, we see

```nil
#<promise:d>
```

To bring the future tense into the present tense, we force a delayed evaluation:

```lisp
(force d)
```

If we ask Scheme to print the result of that expression, we see:

```nil
1/7
```

Exactly what we expect! With this newfound knowledge, we can rewrite the myif function:

```lisp
(define (myif c t f) (cond (c (force t)) (else (force f))))
```

Now myif can accept ts and fs that are delayed and we can use myif safely:

```lisp
(define b 0)
(myif (= b 0) (delay 1) (delay (/ 1 b)))
#+end_src lisp

and we see the reasonable result:
#+begin_src
1
```

Kotlin, a modern language, has a concept similar to delay called [lazy](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/lazy.html) . Ocaml, an object-oriented functional programming language, [contains](https://ocaml.org/manual/coreexamples.html#s:lazy-expr) the same concept . Swift has some sense of [laziness](https://docs.swift.org/swift-book/LanguageGuide/Properties.html) , too!


## Well, We Are Back to Normal Order {#well-we-are-back-to-normal-order}

I guess that we are stuck with the inefficiency inherent in the normal order function application. Going back to the dbl/average example, we will just have to live with invoking average twice.

Or will we?

Real-world functional programming languages that are normal order use an interesting optimization to avoid these recalculations! When an expression is passed around and it is unevaluated, Haskell and languages like it represent it as a thunk (Links to an external site.). The thunk data structure is generated in such a way that it can calculate the value of its associated expression some time in the future when the value is needed. Additionally, the thunk then caches (or memoizes) the value so that future evaluations of the associated expression do not need to be repeated.

As a result, in the dbl/average example,

1.  a thunk is created for (average 3 4 5),
2.  that thunk is passed to dbl, where it is duplicated during the reduction of dbl,
3.  (average 3 4 5) is (eventually) calculated for the first time using the thunk,
4.  4 is stored (cached, memoized) in the thunk, and
5.  the cached/memoized value is retrieved from the thunk instead of evaluating (average 3 4 5) for a second time.

A thunk, then, is the mechanism that allows the programmer to have the efficiency of applicative order function invocation with the semantics of the normal order function invocation!
