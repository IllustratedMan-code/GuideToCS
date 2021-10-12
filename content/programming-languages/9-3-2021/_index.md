+++
title = "9/3/2021"
author = ["David Lewis"]
draft = false
+++

Welcome to The Daily PL for 9/3/2021. We spent most of Friday reviewing material from Episode 1 of PL After Dark and going over scoping examples in C++ and Python. Before continuing, make sure that you have viewed Episode 1 of PL After Dark.


## Scope {#scope}

We briefly discussed the difference between local and global scope.

It is easy to get fooled into thinking that a variable's name is intrinsic to the variable. However, a variable's name is just another binding like address, storage, value, etc.

As a programmer, when a variable is local determining the name/variable binding is straightforward. Determining the name/variable binding becomes more complicated (and more important) when source code uses a non-local name to reference a variable. In cases like this, determining the name/variable binding depends on whether the language is statically or dynamically scoped.


### Static Scoping {#static-scoping}

This is sometimes also known as _lexical scoping_. _Static scoping_ is the type of scope that can be determined using only the program's source code. In a statically scoped programming language, determining the name/variable binding is done iteratively by searching through a _block_'s nesting _static parents_. A _block_ is a section of code with its own scope (in Python that is a function or a class and in C/C++ that is statements enclosed in a pair of {}s). The static parent of a block is the block in which the current block was declared. The list of static parents of a block are the block's static ancestors.

Here is pseudocode for the algorithm of determining the name/variable binding in a statically scoped programming language:

```jupyter-python
def resolve(name, current_scope) -> variable
  s = current_scope
  while (s != InvalidScope)
    if s.contains(name)
      return s.variable(name)
    s = s.static_parent_scope()
  return NameError
```

For practice doing name/variable binding in a statically scoped language, play around with an example in Python: [static\_scope.py](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/static%5Fscope.py)


### Consider this ... {#consider-this-dot-dot-dot}

Python and C++ have different ways of creating scopes. In Python and C++ a new scope is created at the beginning of a function definition (and that scope contains the function's parameters automatically). However, Python and C++ differ in the way that scopes are declared (or not!) for variables used in loops. Consider the following Python and C++ code (also available at [loop\_scope.cpp](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/loop%5Fscope.cpp) and [loop\_scope.py](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/loop%5Fscope.py) :

```jupyter-python
def f():
  for i in range(1, 10):
    print(f"i (in loop body): {i}")
  print(f"i (outside loop body): {i}")
```

```c++
void f() {
  for (int i = 0; i<10; i++) {
    std::cout << "i: " << i << "\n";
  }

  // The following statement will cause a compilation error
  // because i is local to the code in the body of the for
  // loop.
  // std::cout << "i: " << i << "\n";
}
```

In the C++ code, the `for` loop introduces a new scope and `i` is in that scope. In the Python code, the `for` loop does not introduce a new scope and `i` is in the scope of `f`. Try to run the following Python code also available here at [loop\_scope\_error.py](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/loop%5Fscope%5Ferror.py) to see why this distinction is important:

```jupyter-python
def f():
  print(f"i (outside loop body): {i}")
  for i in range(1, 10):
    print(f"i (in loop body): {i}")
```


### Dynamic Scoping {#dynamic-scoping}

_Dynamic scoping_ is the type of scope that can be determined only during program execution. In a dynamically scoped programming language, determining the name/value binding is done iteratively by searching through a block's nesting dynamic parents. The _dynamic parent_ of a block is the block from which the current block was executed. Very few programming languages use dynamic scoping (BASH, Perl [optionally] are two examples) because it makes checking the types of variables difficult for the programmer (and impossible for the compiler/interpreter) and because it increases the "distance" between name/variable binding and use during program execution. However, dynamic binding makes it possible for functions to require fewer parameters because dynamically scoped non local variables can be used in their place.

```jupyter-python
def resolve(name, current_scope) -> variable
  s = current_scope
  while (s != InvalidScope)
    if s.contains(name)
      return s.variable(name)
    s = s.dynamic_parent_scope()
  return NameError
```

For practice doing name/variable binding in a dynamically scoped language, play around with an example in Python: [dynamic\_scope.py](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/dynamic%5Fscope.py) . Note that because Python is intrinsically a statically scoped language, the example includes some hacking of the Python interpreter to emulate dynamic scoping. Compare the `dynamic` in the aforementioned Python code with the `resolve` function in the pseudocode and see if there are differences!


### Referencing Environment (New Material Alert) {#referencing-environment--new-material-alert}

The referencing environment of a statement contains all the name/variable bindings visible at that statement. NOTE: The example in the book on page 224 is absolutely horrendous -- disregard it entirely. Consider the example online here: [referencing\_environment.py](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/referencing%5Fenvironment.py) . Play around with that code and make sure that you understand why certain variables are in the referencing environment and others are not.

In case you think that this is theoretical and not useful to you as a real, practicing programmer, take a look at the official documentation of the Python execution model and see how the language relies on the concept of referencing environments: [naming-and-binding](https://docs.python.org/3/reference/executionmodel.html#naming-and-binding) .


### Scope and Lifetime Are Not the Same (New Material Alert) {#scope-and-lifetime-are-not-the-same--new-material-alert}

It is common for programmers to think that the scope and the lifetime of a variable are the same. However, this is not always true. Consider the following code in C++ (also available at [scope\_new\_lifetime.cpp](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/scope%5Fne%5Flifetime.cpp))

```c++
#include <iostream>

void f(void) {
  static int variable = 4;
}

int main() {
  f();
  return 0;
}
```

In this program, the scope of variable is limited to the function f. However, the lifetime of variable is the entire program. Just something to keep in mind when you are programming!
