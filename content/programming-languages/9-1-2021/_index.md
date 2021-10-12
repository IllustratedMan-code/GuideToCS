+++
title = "9/1/2021"
author = ["David Lewis"]
draft = false
+++

Welcome to the Daily PL for September 1st, 2021! As we turn the page from August to September, we started the month discussing variable lifetime and scope. Lifetime is related to the storage binding and scope is related to the name binding. Before we learned that new material, however, we went over an example of the different bindings and their times in an assignment statement.


## Binding Example {#binding-example}

Consider a Python statement like this:

```python
vrb = arb + 5
```

Recall that a binding is an association between an attribute and an entity. What are some of the possible bindings (and their times) in the statement above?

1.  The symbol + (entity) must be bound to an operation (attribute). In a language like Python, that binding can only be done at runtime. In order to determine whether the operation is a mathematical addition, a string concatenation or some other behavior, the interpreter needs to know the type of arb which is only possible at runtime.
2.  The numerical literal 5 (entity) must be bound to some in-memory representation (attribute). For Python, it appears that the interpreter chooses the format for representing numbers in memory (<https://docs.python.org/3/library/sys.html#sys.int%5Finfo> (Links to an external site.), <https://docs.python.org/3/library/sys.html#sys.float%5Finfo> (Links to an external site.)) which means that this binding is done at the time of language implementation.
3.  The value (attribute) of the variables `vrb` and `arb` (entities) are bound at runtime. Remember that the value of a variable is just another binding.

This is not an exhaustive list of the bindings that are active for this statement. In particular, the variables `vrb` and `arb` must be bound to some address, lifetime and scope. Discussing those bindings requires more information about the statement's place in the source code.


## Variables' Storage Bindings {#variables-storage-bindings}

The storage binding is related to the variable's lifetime (the time during which a variable is bound to memory). There are four common lifetimes:

1.  static: Variable is bound to storage before execution and remains bound to the same storage throughout program execution.
    1.  Variables with static storage binding cannot share memory with other variables (they need their storage throughout execution).
    2.  Variables with static storage binding can be accessed directly (in other words, their access does not require redirection through a pointer) because the address of their storage is constant throughout execution. Direct addressing means that accesses are faster.
    3.  Storage for variables with static binding does not need to be repeatedly allocated and deallocated throughout execution -- this will make program execution faster.
    4.  In C++, variables with static storage binding are declared using the `static` keyword inside functions and classes.
    5.  Variables with static storage binding are sometimes referred to as history sensitive because they retain their value throughout execution.
2.  stack dynamic: Variable is bound to storage when it's declaration statements are elaborated (the time when a declaration statement is executed).

    1.  Variables with stack dynamic storage bindings make recursion possible because their storage is allocated anew every time that their declaration is elaborated. To fully understand this point it is necessary to understand the way that function invocation is handled using a runtime stack. We will cover this topic next week. Stay tuned!
    2.  Variables with stack dynamic storage bindings cannot be directly accessed. Accesses must be made through an intermediary which makes them slower. Again, this will make more sense when we discuss the typical mechanism for function invocation.
    3.  The storage for variables with stack dynamic storage bindings are constantly allocated and deallocated which adds to runtime overhead.

    Variables with stack dynamic storage bindings are not history sensitive.
3.  Explicit heap dynamic: Variable is bound to storage by explicit instruction from the programmer. E.g., `new` / `malloc` in C/C++.
    1.  The binding to storage is done at runtime when these explicit instructions are executed.
    2.  The storage sizes can be customized for the use.
    3.  The storage is hard to manage and requires careful attention from the programmer.
    4.  The storage for variables with explicit heap dynamic storage bindings are constantly allocated and deallocated which adds to runtime overhead.
4.  Implicit heap dynamic: Variable is bound to storage when it is assigned a value at runtime.
    1.  All storage bindings for variables in Python are handled in this way. <https://docs.python.org/3/c-api/memory.html> (Links to an external site.)
    2.  When a variable with implicit heap dynamic storage bindings is assigned a value, storage for that variable is dynamically allocated.
    3.  Allocation and deallocation of storage for variables with implicit heap dynamic storage bindings is handled automatically by the language compiler/interpreter. (More on this when we discuss memory management techniques in Module 3).


## Variables' Name Bindings {#variables-name-bindings}

See the Pl for the [Video](https://uc.instructure.com/courses/1476336/pages/the-daily-pl-9-slash-1-slash-2021?module%5Fitem%5Fid=65306283).

This new material is presented above as Episode 1 of PL After Dark. Below you will find a written recap!

Scope is the range of statements in which a variable is visible (either referencable or assignable). Using the vocabulary of bindings, scope can also be defined as the collection of statements which can access a name binding. In other words, scope determines the binding of a name to a variable.

It is easy to get fooled into thinking that a variable's name is intrinsic to the variable. However, a variable's name is just another binding like address, storage, value, etc. There are two scopes that most languages employ:

-   local: A variable is locally scoped to a unit or block of a program if it is declared there. In Python, a variable that is the subject of an assignment is local to the immediate enclosing function definition. For instance, in

<!--listend-->

```python
def add(a, b):
    total = a + b
    return total
```

`total` is a local variable.

-   global: A variable is globally scoped when it is not in any local scope (terribly unhelpful, isn't it?) Using global variables breaks the principles of encapsulation and data hiding.

For a variable that is used that is not local, the compiler/interpreter must determine to which variable the name refers. Determining the name/variable binding can be done statically or dynamically:


### Static Scoping {#static-scoping}

This is sometimes also known as _lexical scoping_. Static scoping is the type of scope that can be determined using only the program's source code. In a statically scoped programming language, determining the name/variable binding is done iteratively by searching through a block's nesting _static parents_. A _block_ is a section of code with its own scope (in Python that is a function or a class and in C/C++ that is statements enclosed in a pair of {}s). The _static parent_ of a block is the block in which the current block was declared. The list of static parents of a block are the block's _static ancestors_.


### Dynamic Scoping {#dynamic-scoping}

_Dynamic scoping_ is the type of scope that can be determined only during program execution. In a dynamically scoped programming language, determining the name/value binding is done iteratively by searching through a block's nesting _dynamic parents_. The _dynamic parent_ of a block is the block from which the current block was executed. Very few programming languages use dynamic scoping (BASH, PERL [optionally]) because it makes checking the types of variables difficult for the programmer (and impossible for the compiler/interpreter) and because it increases the "distance" between name/variable binding and use during program execution. However, dynamic binding makes it possible for functions to require fewer parameters because dynamically scoped non local variables can be used in their place.
