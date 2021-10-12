+++
title = "Programming Languages"
author = ["David Lewis"]
draft = false
+++

Programming Languages as taught by William Hawkins III


## 8/23/2021 {#8-23-2021}


### Definitions: {#definitions}

1.  programming language: A system of communicating computational ideas between people and computing machines.
2.  high-level programming language: A programming language that is independent of any particular machine architecture.
3.  syntax: The rules for constructing structurally valid (note: valid, not correct) computer programs in a particular language.
4.  names: A means of identifying "entities" in a programming language.
5.  types: A type denotes the kinds of values that a program can manipulate. (A more specific definition will come later in the course).
6.  semantics: The effect of each statement's execution on the program's operation.


### Concepts: {#concepts}

There are four fundamental components of every programming language: syntax, names, types, and semantics.


### Practice: {#practice}

-   For your favorite programming language, attempt to explain the most meaningful parts of its syntax. Think about what are valid identifiers in the language, how statements are separated, whether blocks of code are put inside braces, etc.

-   Next, ask yourself how your favorite language handles types. Are variables in the language given types explicitly or implicitly? If the language is compiled, are types assigned to variables before the code is compiled or as the program executes? These are issues that we will discuss in detail in Module 2.

-   Finally, think about how statements in your favorite programming language affect the program's execution. Does the language have loops? if-then statements? function composition? goto?


## 8/25/2021 {#8-25-2021}


### The value of studying PLs {#the-value-of-studying-pls}

1.  Every new language that you learn gives you new ways to think about and solve problems.
    1.  There is a parallel here with natural languages.
    2.  Certain written/spoken languages have words for concepts that others do not.
    3.  Linguists have said that people can only conceive ideas for which there are words.
    4.  In certain programming languages there may be constructs ("words") that give you a power to solve problems and write algorithms in new, interesting ways.
2.  You can choose the right tool for the job.
    -   When all you have is a hammer, everything looks like a nail.
3.  Makes you an increasingly flexible programmer.
    -   The more you know about the concepts of programming languages (and the PLs that you know) the easier it is to learn new languages.
4.  Using PLs better
    Studying PLs will teach you about how languages are implemented.
    This "awareness" can give you insight into the "right way" to do something in a particular language.
    For instance, if you know that recursion and looping are equally performant and computationally powerful, you can choose to use the one that improves the readability of your code. However, if you know that iteration is faster (and that's important for your application) then you will choose that method for invoking statements repeatedly.


### Programming domains {#programming-domains}

-   We write programs to solve real-world problems.
-   The problems that we are attempting to solve lend themselves to programming languages with certain characteristics.
-   Some of those real-world problems are related to helping others solve real-world problems (systems programs):
    -   e.g., operating systems, utilities, compilers, interpreters, etc.
    -   There are a number of good languages for writing these applications: C, C++, Rust, Python, Go, etc.
-   But, most of programs are designed/written to solve actually real-world problems:
    -   scientific calculations: these applications need to be fast (parallel?) and mathematically precise (work with numbers of many kinds). Scientific applications were the earliest programming domain and inspired the first high-level programming language, Fortran.
    -   artificial intelligence: AI applications manipulate symbols (in particular, lists of symbols) as opposed to numbers. This application requirement gave rise to a special type of language designed especially for manipulating lists, Lisp (List Processor).
    -   world wide web: WWW applications must embed code in data (HTML). Because of how WWW applications advance so quickly, it is important that languages for writing these applications support rapid iteration. Common languages for writing web applications are PERL, Python, JavaScript, Ruby, Go, etc.
    -   business: business applications need to produce reports, process character-based data, describe and store numbers with specific precision (aka, decimals). COBOL has traditionally been the language of business applications, although new business applications are being written in other languages these days (Java, the .Net languages).
    -   machine learning: machine learning applications require sophisticated math and algorithms and most developers do not want to rewrite these when good alternatives are available. For this reason, a language with a good ecosystem of existing libraries makes an ideal candidate for writing ML programs (Python).
    -   game development: So-called AAA games must be fast enough to generate lifelike graphics and immersive scenes in near-real time. For this reason, games are often written in a language that is expressive but generates code that is optimized, C++.

This list is non-exhaustive, obviously!


### The John von Neumann Model of Computing {#the-john-von-neumann-model-of-computing}

-   This computing model has had more influence on the development of PLs than we can imagine.
-   There are two hardware components in this Model (the processor [CPU] and the memory) and they are connected by a pipe.
    -   The CPU pipes data and instructions (see below) to/from the memory (fetch).
    -   The CPU reads that data to determine the action to take (decode).
    -   The CPU performs that operation (execute).
    -   Because there is only one path between the CPU and the memory, the speed of the pipe is a bottleneck on the processor's efficiency.
-   The Model is interesting because of the way that it stores instructions and data together in the same memory.
-   It is different than the Harvard Architecture where programs and data are stored in different memory.
-   In the Model, every bit of data is accessible according to its address.
-   Sequential instructions are placed nearby in memory.
    -   For instance, in

<!--listend-->

```c++
for (int i = 0; i < 100; i++) {
  statement1;
  statement2;
  statement3;
}
```

statement1, statement2 and statement3 are all stored one after the other in memory.

-   Modern implementations of the Model make fetching nearby data fast.
-   Therefore, implementing repeated instructions with loops is faster than implementing repeated loops with recursion.
-   **Or is it?**
-   **This is a particular case where learning about PL will help you as a programmer!**


## 8/27/2021 {#8-27-2021}


### Programming Paradigms {#programming-paradigms}

1.  A paradigm is a pattern or model. A programming paradigm is a pattern of problem-solving thought that underlies a particular genre of programs and languages.
    -   According to their syntax, names and types, and semantics, it is possible to classify languages into one of four categories (imperative, object-oriented, functional and logic).
    -   That said, modern researchers in PL are no longer as convinced that these are meaningful categories because new languages are generally a collection of functionality and features and contain bits and pieces from each paradigm.
2.  The paradigms:
    1.  Imperative: Imperative languages are based on the centrality of assignment statements to change program state, selection statements to control program flow, loops to repeat statements and procedures for process abstraction (a term we will learn later).
        -   These languages are most closely associated with the von Neumann architecture, especially assignment statements that approximate the piping operation at the hardware level.
        -   Examples of imperative languages include C, Fortran, Cobol, Perl.
    2.  Object-oriented: Object-oriented languages are based upon a combination of data abstraction, data hiding, inheritance and message passing.
        -   Objects respond to messages by modifying their internal data -- in other words, they become active.
        -   The power of inheritance is that an object can reuse an implementation without having to rewrite the code.
        -   These languages, too, are closely associated with the von Neumann architecture and (usually) inherit selection statements, assignment statements and loops from imperative programming languages.
            Examples of object-oriented languages include Smalltalk, Ruby, C++, Java, Python, JavaScript.
    3.  Functional: Functional programming languages are based on the concept that functions are first-class objects in the language -- in other words, functions are just another type like integers, strings, etc.
        -   In a functional PL, functions can be passed to other functions as parameters and returned from functions.
        -   The loops and selection statements of imperative programming languages are replaced with composition, conditionals, and recursion in functional PLs.
        -   A subset of functional PLs are known as pure functional PLs because functions those languages have no side-effects (a side-effect occurs in a function when that function performs a modification that can be seen outside the function -- e.g., changing a value of a parameter, changing a global variable, etc).
        -   Examples of functional languages include Lisp, Scheme, Haskell, ML, JavaScript, Python.
    4.  Logic: Simply put, logic programming languages are based on describing what to compute and not how to compute it.
        -   Prolog (and its variants) are really the only logic programming language in widespread use.


### Language Evaluation Criteria (New Material Alert) {#language-evaluation-criteria--new-material-alert}

There are four (common) criteria for evaluating a programming language:

1.  Readability: A metric for describing how easy/hard it is to comprehend the meaning of a computer program written in a particular language.
    1.  Overall simplicity: The number of basic concepts that a PL has.
        1.  Feature multiplicity: Having more than one way to accomplish the same thing.
        2.  Operator overloading: Operators perform different computation depending upon the context (i.e., the type of the operands)
        3.  Simplicity can be taken too far. Consider machine language.

    2.  Orthogonality: How easy/hard it is for the constructs of a language to be combined to build higher-level control and data structures.
        1.  Alternate definition: The mutual independence of primitive operations.
        2.  Orthogonal example: any type of entity in a language can be passed as a parameter to a function.
        3.  Non-orthogonal example: only certain entities in a language can be used as a return value from a function (e.g., in C/C++ you cannot return an array).
        4.  This term comes from the mathematical concept of orthogonal vectors where orthogonal means independent.
        5.  The more orthogonal a language, the fewer exceptional cases there are in the language's semantics.
        6.  The more orthogonal a language, the slower the language: The compiler/interpreter must be able to compute based on every single possible combination of language constructs. If those combinations are restricted, the compiler can make optimizations and assumptions that will speed up program execution.
    3.  Data types: Data types make it easier to understand the meaning of variables.
        -   e.g., the difference between `int userHappy = 0;` and `bool userHappy = True;`
    4.  Syntax design
        1.  A PL's reserved words should make things clear. For instance, it is easier to match the beginnings and endings of loops in a language that uses names rather than { }s.
        2.  The PL's syntax should evoke the operation that it is performing.
            1.  For instance, a + should perform some type of addition operation (mathematical, concatenation, etc)
2.  Writeability
    1.  Includes all the aspects of Readability, and
    2.  Expressiveness: An expressive language has relatively convenient rather than cumbersome way of specifying computations.
3.  Reliability: How likely is it that a program written in a certain PL is correct and runs without errors.
    1.  Type checking: a language with type checking is more reliable than one without type checking; type checking is testing for operations that compute on variables with incorrect types at compile time or runtime.
        -   Type checking is better done at runtime.
        -   A strongly typed programming language is one that is always able to detect type errors either at compile time or runtime.
    2.  Exception handling (the ability of a program to intercept runtime errors and take corrective action) and aliasing (when two or more distinct names in a program point to the same resource) affect the PL's reliability.
    3.  3. 3. 3. 3. 3. 3. 3. In truth, there are so many things that affect the reliability of a PL.
    4.  The easier a PL is to read and write, the more reliable the code is going to be.
4.  Cost: The cost of writing a program in a certain PL is a function of
    1.  The cost to train programmers to use that language
    2.  The cost of writing the program in that language
    3.  The time/speed of execution of the program once it is written
    4.  The cost of poor reliability
    5.  The cost of maintenance -- most of the time spent on a program is in maintaining it and not developing it!


## 8/30/2021 {#8-30-2021}

Today we learned a more complete definition of imperative programming languages and studied the defining characteristics of variables. Unfortunately we did not get as far as I wanted during the class which means that there is some new material in this edition of the Daily PL!


### Imperative Programming Languages {#imperative-programming-languages}

Any language that is an abstraction of the von Neumann Architecture can be considered an imperative programming language.

There are 5 calling cards of imperative programming languages:

1.  _state, assignment statements, and expressions_: Imperative programs have state. Assignment statements are used to modify the program state with computed values from expressions
    1.  _state_: The contents of the computer's memory as a program executes.
    2.  _expression_: The fundamental means of specifying a computation in a programming language. As a computation, they produce a value.
    3.  _assignment statement_: A statement with the semantic effect of destroying a previous value contained in memory and replacing it with a new value. The primary purpose of the assignment statement is to have a side effect of changing values in memory. As Sebesta says, "The essence of the imperative programming languages is the dominant role of the assignment statement."
2.  _variables_: The abstraction of the memory cell.
3.  _loops_: Iterative form of repetition (for, while, do ... while, foreach, etc)
4.  _selection statements_: Conditional statements (if/then, switch, when)
5.  _procedural abstraction_: A way to specify a process without providing details of how the process is performed. The primary means of procedural abstraction is through definition of subprograms (functions, procedures, methods).


### Variables {#variables}

There are 6 attributes of variables. Remember, though, that a variable is an abstraction of a memory cell.

1.  _type_: Collection of a variable's valid data values and the collection of valid operations on those values.
2.  _name_: String of characters used to identify the variable in the program's source code.
3.  _scope_: The range of statements in a program in which a variable is visible.
    Using the yet-to-be-defined concept of binding, there is an alternative definition: The range of statements where the name's binding to the variable is active.
4.  _lifetime_: The period of time during program execution when a variable is associated with computer memory.
5.  _address_: The place in memory where a variable's contents (value) are stored. This is sometimes called the variable's l-value because only a variable associated with an address can be placed on the left side of an assignment operator.
6.  _value_: The contents of the variable. The value is sometimes call the variable's r-value because a variable with a value can be used on the right side of an assignment operator.


### Looking forward to Binding (New Material Alert) {#looking-forward-to-binding--new-material-alert}

A _binding_ is an association between an attribute and an entity in a programming language. For example, you can bind an operation to a symbol: the + symbol can be bound to the addition operation.

_Binding_ can happen at various times:

1.  Language design (when the language's syntax and semantics are defined or standardized)
2.  Language implementation (when the language's compiler or interpreter is implemented)
3.  Compilation
4.  Loading (when a program [either compiled or interpreted] is loaded into memory)
5.  Execution

A _static binding_ occurs before runtime and does not change throughout program execution. A _dynamic binding_ occurs at runtime and/or changes during program execution.

Notice that the six "things" we talked about that characterize variables are actually attributes!! In other words, those attributes have to be bound to variables at some point. When these bindings occur is important for users of a programming language to understand. We will discuss this on Wednesday!
blob:<https://1492301-4.kaf.kaltura.com/903896d9-2341-4dd3-9709-ca344de08719>


## 9/1/2021 {#9-1-2021}

Welcome to the Daily PL for September 1st, 2021! As we turn the page from August to September, we started the month discussing variable lifetime and scope. Lifetime is related to the storage binding and scope is related to the name binding. Before we learned that new material, however, we went over an example of the different bindings and their times in an assignment statement.


### Binding Example {#binding-example}

Consider a Python statement like this:

```python
vrb = arb + 5
```

Recall that a binding is an association between an attribute and an entity. What are some of the possible bindings (and their times) in the statement above?

1.  The symbol + (entity) must be bound to an operation (attribute). In a language like Python, that binding can only be done at runtime. In order to determine whether the operation is a mathematical addition, a string concatenation or some other behavior, the interpreter needs to know the type of arb which is only possible at runtime.
2.  The numerical literal 5 (entity) must be bound to some in-memory representation (attribute). For Python, it appears that the interpreter chooses the format for representing numbers in memory (<https://docs.python.org/3/library/sys.html#sys.int%5Finfo> (Links to an external site.), <https://docs.python.org/3/library/sys.html#sys.float%5Finfo> (Links to an external site.)) which means that this binding is done at the time of language implementation.
3.  The value (attribute) of the variables `vrb` and `arb` (entities) are bound at runtime. Remember that the value of a variable is just another binding.

This is not an exhaustive list of the bindings that are active for this statement. In particular, the variables `vrb` and `arb` must be bound to some address, lifetime and scope. Discussing those bindings requires more information about the statement's place in the source code.


### Variables' Storage Bindings {#variables-storage-bindings}

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


### Variables' Name Bindings {#variables-name-bindings}

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


#### Static Scoping {#static-scoping}

This is sometimes also known as _lexical scoping_. Static scoping is the type of scope that can be determined using only the program's source code. In a statically scoped programming language, determining the name/variable binding is done iteratively by searching through a block's nesting _static parents_. A _block_ is a section of code with its own scope (in Python that is a function or a class and in C/C++ that is statements enclosed in a pair of {}s). The _static parent_ of a block is the block in which the current block was declared. The list of static parents of a block are the block's _static ancestors_.


#### Dynamic Scoping {#dynamic-scoping}

_Dynamic scoping_ is the type of scope that can be determined only during program execution. In a dynamically scoped programming language, determining the name/value binding is done iteratively by searching through a block's nesting _dynamic parents_. The _dynamic parent_ of a block is the block from which the current block was executed. Very few programming languages use dynamic scoping (BASH, PERL [optionally]) because it makes checking the types of variables difficult for the programmer (and impossible for the compiler/interpreter) and because it increases the "distance" between name/variable binding and use during program execution. However, dynamic binding makes it possible for functions to require fewer parameters because dynamically scoped non local variables can be used in their place.


## 9/3/2021 {#9-3-2021}

Welcome to The Daily PL for 9/3/2021. We spent most of Friday reviewing material from Episode 1 of PL After Dark and going over scoping examples in C++ and Python. Before continuing, make sure that you have viewed Episode 1 of PL After Dark.


### Scope {#scope}

We briefly discussed the difference between local and global scope.

It is easy to get fooled into thinking that a variable's name is intrinsic to the variable. However, a variable's name is just another binding like address, storage, value, etc.

As a programmer, when a variable is local determining the name/variable binding is straightforward. Determining the name/variable binding becomes more complicated (and more important) when source code uses a non-local name to reference a variable. In cases like this, determining the name/variable binding depends on whether the language is statically or dynamically scoped.


#### Static Scoping {#static-scoping}

This is sometimes also known as _lexical scoping_. _Static scoping_ is the type of scope that can be determined using only the program's source code. In a statically scoped programming language, determining the name/variable binding is done iteratively by searching through a _block_'s nesting _static parents_. A _block_ is a section of code with its own scope (in Python that is a function or a class and in C/C++ that is statements enclosed in a pair of {}s). The static parent of a block is the block in which the current block was declared. The list of static parents of a block are the block's static ancestors.

Here is pseudocode for the algorithm of determining the name/variable binding in a statically scoped programming language:

```python
def resolve(name, current_scope) -> variable
  s = current_scope
  while (s != InvalidScope)
    if s.contains(name)
      return s.variable(name)
    s = s.static_parent_scope()
  return NameError
```

For practice doing name/variable binding in a statically scoped language, play around with an example in Python: [static\_scope.py](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/static%5Fscope.py)


#### Consider this ... {#consider-this-dot-dot-dot}

Python and C++ have different ways of creating scopes. In Python and C++ a new scope is created at the beginning of a function definition (and that scope contains the function's parameters automatically). However, Python and C++ differ in the way that scopes are declared (or not!) for variables used in loops. Consider the following Python and C++ code (also available at [loop\_scope.cpp](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/loop%5Fscope.cpp) and [loop\_scope.py](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/loop%5Fscope.py) :

```python
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

```python
def f():
  print(f"i (outside loop body): {i}")
  for i in range(1, 10):
    print(f"i (in loop body): {i}")
```


#### Dynamic Scoping {#dynamic-scoping}

_Dynamic scoping_ is the type of scope that can be determined only during program execution. In a dynamically scoped programming language, determining the name/value binding is done iteratively by searching through a block's nesting dynamic parents. The _dynamic parent_ of a block is the block from which the current block was executed. Very few programming languages use dynamic scoping (BASH, Perl [optionally] are two examples) because it makes checking the types of variables difficult for the programmer (and impossible for the compiler/interpreter) and because it increases the "distance" between name/variable binding and use during program execution. However, dynamic binding makes it possible for functions to require fewer parameters because dynamically scoped non local variables can be used in their place.

```python
def resolve(name, current_scope) -> variable
  s = current_scope
  while (s != InvalidScope)
    if s.contains(name)
      return s.variable(name)
    s = s.dynamic_parent_scope()
  return NameError
```

For practice doing name/variable binding in a dynamically scoped language, play around with an example in Python: [dynamic\_scope.py](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/dynamic%5Fscope.py) . Note that because Python is intrinsically a statically scoped language, the example includes some hacking of the Python interpreter to emulate dynamic scoping. Compare the `dynamic` in the aforementioned Python code with the `resolve` function in the pseudocode and see if there are differences!


#### Referencing Environment (New Material Alert) {#referencing-environment--new-material-alert}

The referencing environment of a statement contains all the name/variable bindings visible at that statement. NOTE: The example in the book on page 224 is absolutely horrendous -- disregard it entirely. Consider the example online here: [referencing\_environment.py](https://github.com/hawkinsw/cs3003/blob/main/scope%5Flifetime/referencing%5Fenvironment.py) . Play around with that code and make sure that you understand why certain variables are in the referencing environment and others are not.

In case you think that this is theoretical and not useful to you as a real, practicing programmer, take a look at the official documentation of the Python execution model and see how the language relies on the concept of referencing environments: [naming-and-binding](https://docs.python.org/3/reference/executionmodel.html#naming-and-binding) .


#### Scope and Lifetime Are Not the Same (New Material Alert) {#scope-and-lifetime-are-not-the-same--new-material-alert}

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


## 9/8/2021 {#9-8-2021}

Welcome to The Daily PL for September 8, 2021. I'm not lying when I say that this is the best. edition. ever. There is new material included in this edition which will be covered in a forthcoming episode of PL After Dark. When that video is available, this post will be updated!


### Recap {#recap}

The Type Characteristics of a Language

In today's lecture we talked about types (again!). In particular, we talked about the two independent axis of types for a programming language: whether a PL is statically or dynamically typed and whether it is strongly or weakly typed. In other words, the time of the binding of type/variable in a language is independent of that language's ability to detect type errors.

1.  A statically typed language is one where the type/variable binding is done before the code is run and does not change throughout program execution.
2.  A dynamically typed language is one where the type/variable binding is done at runtime and/or may change throughout program execution.

<!--listend-->

1.  A strongly typed language is one where type errors are always detected (either at before or during program execution)
2.  A weakly typed language is one that is, well, not strongly typed.
    ![](/ox-hugo/1.png)

In order to have a completely a satisfying definition of strongly typed language, we defined type error as any error that occurs when an operation is attempted on a type for which it is not well defined. In Python, `"3" + 5` results in a `TypeError: can only concatenate str (not "int") to str`. In this example, the operation is `+` and the types are `str` and `int`.

Certain strongly typed languages _appear_ to be weakly typed because of coercions. A coercion occurs when the language implicitly converts a variable of one type to another. C++ allows the programmer to define operations that will convert the type of a variable from, say, type _a_ to type _b_. If the compiler sees an expression using a variable of type b where only a variable of type a is valid, then it will invoke that conversion operation automatically. While this adds to the language's flexibility, the conversion behavior may hide the fact that a type error exists and, ultimately, make code more difficult to debug. Note that coercions are done implicitly -- a change between types done at the explicit request of the programmer is know as a (_type_)cast.

Finally, before digging in to actual types, we defined type system: A type system is the set of types supported by a language and the rules for their usage.


#### Aggregate Data Types {#aggregate-data-types}

Aggregate data types are data types composed of one or more basic, or primitive, data types. Do not ask me to write a specific definition for primitive data type -- it will only get us into a circular mess :-)


### Array {#array}

An array is a homogeneous (i.e., all its elements must be of the same type) aggregate data type in which an individual element is accessed by its position (i.e., index) in the aggregate. There are myriad design decisions associated with a language's implementation of arrays (the type of the index, whether their size must be fixed or whether it can be dynamic, etc.) One of those design decisions is the way that a language lays out a two dimensional array in memory. There are two options: row-major order and column-major order. For a second, forget the concept of rows and columns altogether and consider that you access two dimensional arrays by letters and numbers. See the following diagram:

![](/ox-hugo/2.png)
The memory of actual computers is linear. Therefore, two dimensional arrays must be _flattened_. In "letter major" order, the slices of the array identified by letters are stored in memory one after the other. In "number major" order, the slices of the array identified by numbers are stored in memory one after another. Notice that, in "letter major" order, the numbers "change fastest" and that, in "number major" order, the letters "change fastest".

Substitute "row" for "letter" and "column" for "number" and, voila, you understand!! The C programming language stores arrays in row-major order; Fortran stores arrays in column-major order.

Keep in mind that this description is only one way (or many) to store two dimensional arrays. There are (Links to an external site.) others (Links to an external site.).


### Associative Arrays, Records, Tuples, Lists, Unions, Algebraic Data Types, Pattern Matching, List Comprehensions, and Equivalence {#associative-arrays-records-tuples-lists-unions-algebraic-data-types-pattern-matching-list-comprehensions-and-equivalence}

All that, and more, in Episode 2 of PL After Dark!

Note: In this video, I said that Python's Lists function as arrays and that Python does not have true arrays. Your book implies as much in the section on Lists. However, I went back to check, and it does appear that there is a standard module in Python that provides arrays, in certain cases. Take a look at the documentation here: [python arrays](https://docs.python.org/3/library/array.html) . The commonly used NumPy package also provides an array type: [numpy arrays](https://numpy.org/doc/stable/reference/generated/numpy.array.html) . While the language, per se, does not define an array type, the presence of the modules (particularly the former) is important to note. Sorry for the confusion!


## 9/10/2021 {#9-10-2021}

In today's edition of the Daily PL we will recap our discussion from today that covered expressions, order of evaluation, short-circuit evaluation and referential transparency.


### Expressions {#expressions}

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


### Order of Evaluation {#order-of-evaluation}

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


### Short-circuit Evaluation {#short-circuit-evaluation}

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


### Referential Transparency {#referential-transparency}

Most of these issues would not be a problem if programmer's wrote functions that did not have side effects (remember that those are called pure functions). There are languages that will not allow side effects and those languages support referential transparency: A function has referential transparency if its value (its output) depends only on the value of its parameter(s). In other words, if given the same inputs, a referentially transparent function always gives the same output.


### Put It All Together {#put-it-all-together}

Try you hand at the practice quiz Expressions, precedence, associativity and coercions to check your understanding of the material we covered in class on Friday and the material from your assigned reading! For the why, check out [relational.cpp](https://github.com/hawkinsw/cs3003/blob/main/expressions/relational.cpp) .


## 9/13/2021 {#9-13-2021}

In today's edition of the Daily PL we will recap our discussion from today that covered subprograms, polymorphism and coroutines!


### Subprograms {#subprograms}

A _subprogram_ is a type of abstraction. It is process abstraction where the how of a process is hidden from the user who concerns themselves only with the what. A subprogram provides process abstraction by naming a collection of statements that define parameterized computations.​ Again, the collection of statements determines how the process is implemented. Subprogram parameters give the user the ability to control the way that the process executes. There are three types of subprograms:

1.  Procedure: A subprogram that does not return a value.
2.  Function: A subprogram that does return a value.
3.  Method: A subprogram that operates with an implicit association to an object; a method may or may not return a value.

Pay close attention to the book's explanation and definitions of terms like parameter, parameter profile, argument, protocol, definition, and declaration.

Subprograms are characterized by three facts:

1.  A subprogram has only one entry point
2.  Only one subprogram is active at any time
3.  Program execution returns to the caller upon completion


### Polymorphism {#polymorphism}

_Polymorphism_ allows subprograms to take different types of parameters on different invocations. There are two types of polymorphism:

1.  _ad-hoc polymorphism:_ A type of polymorphism where the semantics of the function may change depending on the parameter types.
2.  _parametric polymorphism_: A type of polymorphism where subprograms take an implicit/explicit type parameter used to define the types of their subprogram's parameters; no matter the value of the type parameter, in parametric polymorphism the subprogram's semantics are always the same.

Ad-hoc polymorphism is sometimes call function overloading (C++). Subprograms that participate in ad-hoc polymorphism share the same name but must have different protocols. If the subprograms' protocols and names were the same, how would the compiler/interpreter choose which one to invoke? Although a subprogram's protocol includes its return type, not all languages allow ad-hoc polymorphism to depend on the return type (e.g., C++). See the various definitions of `add` in the C++ code here: [subprograms.cpp](https://github.com/hawkinsw/cs3003/blob/main/subprograms/subprograms.cpp) . Note how they all have different protocols. Further, note that not all the versions of the function `add` perform an actual addition! That's the point of ad-hoc polymorphism -- the programmer can change the meaning of a function.

Functions that are parametrically polymorphic are sometimes called function templates (C++) or generics (Java, soon to be in Go, Rust). A parametrically polymorphic function is like the blueprint for a house with a variable number of floors. A home buyer may want a home with three stories -- the architect takes their variably floored house blueprint and "stamps out" a version with three floors. Some "new" languages call this process monomorphization (Links to an external site.). See the definition of minimum in the C++ code here: [subprograms.cpp](https://github.com/hawkinsw/cs3003/blob/main/subprograms/subprograms.cpp) . Note how there is only one definition of the function. The associated type parameter is `T`. The compiler will "stamp out" copies of minimum for different types when it is invoked. For example, if the programmer writes

```c++

auto m = minimum(5, 4);
```

then the compiler will generate

```c++
int minimum(int a, int b) {

 return a < b ? a : b;
}
```

behind the scenes.


### Coroutines {#coroutines}

Just when you thought that you were getting the hang of subprograms, a new kid steps on the block: coroutines. Sebesta defines coroutines as a subprogram that cooperates with a caller. The first time that a programmer uses a coroutine, they call it at which point program execution is transferred to the statements of the coroutine. The coroutine executes until it yields control. The coroutine may yield control back to its caller or to another coroutine. When the coroutine yields control, it does not cease to exist -- it simply goes dormant. When the coroutine is again invoked -- resumed -- the coroutine begins executing where it previously yielded. In other words, coroutines have

1.  multiple entry points
2.  full control over execution until they yield
3.  the property that only one is active at a time (although many may be dormant)

Coroutines could be used to write a card game. Each player is a coroutine that knows about the player to their left (that is, a coroutine). The PlayerA coroutine performs their actions (perhaps drawing a card from the deck, etc) and checks to see if they won. If they did not win, then the PlayerA coroutine yields to the PlayerB coroutine who performs the same set of actions. This process continues until a player no longer has someone to their left. At that point, everything unwinds back to the point where PlayerA was last resumed -- the signal that a round is complete. The process continues by resuming PlayerA to start another round of the game. Because each player is a coroutine, it never ceased to exist and, therefore, retains information about previous draws from the deck. When a player finally wins, the process completes. To see this in code, check out  [cardgame.py](https://github.com/hawkinsw/cs3003/blob/main/subprograms/cardgame.py) .


## 9/20/2021 {#9-20-2021}

This is an issue of the Daily PL that you are going to want to make sure that you keep safe -- definitely worth framing and passing on to your children! You will want to make sure you remember where you were when you first learned about ...


### Formal Program Semantics {#formal-program-semantics}

Although we have not yet learned about it (we will, don't worry!), there is a robust set of theory around the way that PL designers describe the syntax of their language. You can use regular expressions, context-free grammars, parsers (recursive-descent, etc) and other techniques for defining what is a valid program.

On the other hand, there is less of a consensus about how a program language designer formally describes the semantics of programs written in their language. The codification of the semantics of a program written in a particular is known as _formal program semantics_. In other words, formal program semantics are a  precise mathematical description of the semantics of an executing program.​ Sebesta uses the term _dynamic semantics_ which is defines as the "meaning[] of the expressions, statements and program units of a programming language."

The goal of defining formal program semantics is to understand and reason about the behavior of programs. There are many, many reasons why PL designers want a formal semantics of their language. However, there are two really important reasons: With formal semantics it is possible to prove that

1.  two programs calculate the same result (in other words, that two programs are equivalent), and
2.  a program calculates the correct result.

The alternative to formal program semantics are standards promulgated by committees that use natural language to define the meaning of program elements. Here is an example of a page from the standard for the C programming language:

{{< figure src="/ox-hugo/3.png" >}}

If you are interested, you can find the [C++ language standard](https://isocpp.org/std/the-standard) , [the Java language standard](https://docs.oracle.com/javase/specs/) , the [C language standard](http://www.open-std.org/jtc1/sc22/wg14/) , [the Go language standard](https://golang.org/ref/spec) and [the Python language standard](https://docs.python.org/3/reference/)  all online.


### Testing vs Proving {#testing-vs-proving}

There is absolutely a benefit to testing software. No doubt about it. However, testing that a piece of software behaves a certain way does not prove that it operates a certain way.

_"Program testing can be used to show the presence of bugs, but never to show their absence!"_ - [Edsger Dijkstra](https://en.wikipedia.org/wiki/Edsger%5FW.%5FDijkstra)

There is an entire field of computer science known as formal methods whose goal is to understand how to write software that is provably correct. There are systems available for writing programs about which things can be proven. There is [PVS](https://pvs.csl.sri.com/), [Coq](https://coq.inria.fr/) ,[Isabelle](https://isabelle.in.tum.de/doc/tutorial.pdf) , and [TLA+](https://lamport.azurewebsites.net/tla/tla.html) , to name a few. PVS is used by NASA to write its mission-critical software and even it makes an appearance in the movie [The Martian](https://shemesh.larc.nasa.gov/fm/pvs/TheMartian/) .


### Three Types of Formal Semantics {#three-types-of-formal-semantics}

There are three common types of formal semantics. It is important that you know the names of these systems, but we will only focus on one in this course!

1.  Operational Semantics: The meaning of a program is defined by how the program executes on an idealized virtual machine.
2.  Denotational Semantics: Program units "denote" mathematical functions and those functions transform the mathematically defined state of the program.
3.  Axiomatic Semantics: The meaning of the program is based on proof rules for each programming unit with an emphasis on proving the correctness of a program.

We will focus on operational semantics only!


### Operational Semantics {#operational-semantics}


#### Program State {#program-state}

We have referred to the state of the program throughout this course. We have talked about how statements in imperative languages can have side effects that affect the value of the state and we have talked about how the assignment statement's raison d'etre is to change a program's state. For operational semantics, we have to very precisely define a program's state.

At all times, a program has a state. A state is just a function whose domain is the set of defined program variables and whose range is V \* T where V is the set of all valid variable values (e.g., 5, 6.0, True, "Hello", etc) and T is the set of all valid variable types (e.g., Integer, Floating Point, Boolean, String, etc). ​In other words, you can ask a state about a particular variable and, if it is defined, the function will return the variable's current value and its type.

It is important to note that PL researchers have math envy. They are not mathematicians but they like to use Greek symbols. So, here we go:

\begin{equation\*}
\sigma(x) = (v, \tau)
\end{equation\*}

The state function is denoted with the σ
. τ always represents some arbitrary variable type. Generally, v represents a value. So, you can read the definition above as "Variable x has value v and type τ in state σ."


#### Program Configuration {#program-configuration}

Between execution steps (a term that we will define shortly), a program is always in a particular configuration:

\begin{equation\*}
<e, \sigma>
\end{equation\*}

This means that the program in state σ

is about to evaluate expression e.


#### Program Steps {#program-steps}

A program step is an atomic (indivisible) change from one program configuration to another. Operational semantics defines steps using rules. The general form of a rule is

\begin{equation\*}
\frac{premises}{conclusion}
\end{equation\*}

The conclusion is generally written like <e, σ> ⟶ (v, τ, σ). This statement means that, when the premises hold, the rule evaluates to a value (v), type (τ) and (possibly modified) state (σ') after a single step of execution of a program in configuration <e, σ>. Note that rules do not yield configurations. All this will make sense when we see an example.


### Example 1: Defining the semantics of variable access. {#example-1-defining-the-semantics-of-variable-access-dot}

In STIMPL, the expression to access a variable, say i, is written like Variable("i"). Our operational semantic rule for evaluating such an access should "read" something like: When the program is about to execute an expression to access variable i in a state σ, the value of the expression will be the triple of i's value, i's type and the unchanged state σ." In other words, the evaluation of the next step of a program that is about to access a value is the value and type of the variable being accessed and the program's state is unchanged.

Let's write that formally!

\begin{equation\*}
\\(\frac{\sigma(x) \rightarrow (v, \tau)} {<\text{Variable}(x), \sigma > \rightarrow (v, \tau, \sigma)}\\)
\end{equation\*}


#### State Update {#state-update}

How do we write down that the state is being changed? Why would we want to change the state? Let's answer the second question first: we want to change the state when, for example, there is an assignment statement. If σ
("i") = (4, Integer) and then the program evaluated an expression like Assign(Variable("i"), IntLiteral(2)), we don't want the σ

function to return (4, Integer) any more! We want it to return (2, Integer). We can define that mathematically like:

\begin{equation\*}
\sigma[(v,\tau)/x\]\(y)= \begin{cases} & \sigma(y) \quad y \ne x \\ &(v,\tau) \quad y=x \end{cases}
\end{equation\*}

This means that if you are querying the updated state for the variable that was just reassigned (x), then return its new value and type (m and τ
). Otherwise, just return the value that you would get from accessing the existing σ

.


### Example 2: Defining the semantics of variable assignment (for a variable that already exists). {#example-2-defining-the-semantics-of-variable-assignment--for-a-variable-that-already-exists--dot}

In STIMPL, the expression to overwrite the value of an existing variable, say i, with, say, an integer literal 5 is written like `Assign(Variable("i"), IntLiteral(5))`. Our operational semantic rule for evaluating such an assignment should "read" something like: When the program is about to execute an expression to assign variable i to the integer literal 5 in a state σ
and the type of the variable i in state σ is Integer, the value of the expression will be the triple of 5, Integer and the changed state σ' which is exactly the same as state σ

except where (5, Integer) replaced i's earlier contents." That's such a mouthful! But, I think we got it. Let's replace some of those literals with symbols for abstraction purposes and then write it down!

\begin{equation\*}
\frac{<e, \sigma> \longrightarrow (v, \tau, \sigma'), \sigma(x) \longrightarrow (\*,, \tau)} {<\text{Assign(Variable)}(x, e), \sigma > \longrightarrow (v, \tau, \sigma' [(v, \tau)/x])}
\end{equation\*}

Let's look at it step-by-step:

\begin{equation\*}
<Assign(Variable(x),e),\sigma>
\end{equation\*}

is the configuration and means that we are about to execute an expression that will assign value of expression e to variable x. But what is the value of expression e? The premise

\begin{equation}
<e,\sigma>⟶(v,\tau, \sigma′)
\end{equation}

tells us that the value and type of e when evaluated in state σ
is v, and τ. Moreover, the premise tells us that the state may have changed during evaluation of expression e and that subsequent evaluation should use a new state, σ

'. Our mouthful above had another important caveat: the type of the value to be assigned to variable x must match the type of the value already stored in variable x. The second premise

\begin{equation\*}
\sigma′(x)\longrightarrow(\*, \tau)
\end{equation\*}

tells us that the types match -- see how the τs are the same in the two premises? (We use the \* to indicate that we don't care what that value is!)

Now we can just put together everything we have and say that the expression assigning the value of expression e to variable x evaluates to

\begin{equation\*}
(v,\tau,\sigma′[(v,\tau)/x])
\end{equation\*}


#### That's Great, But Show Me Code! {#that-s-great-but-show-me-code}

Well, Will, that's fine and good and all that stuff. But, how do I use this when I am implementing STIMPL? I'll show you! Remember the operational semantics for variable access:

\begin{equation\*}
\\(\frac{\sigma(x) \rightarrow (v, \tau)} {<\text{Variable}(x), \sigma > \rightarrow (v, \tau, \sigma)}\\)
\end{equation\*}

Compare that with the code for it's implementation in the STIMPL skeleton that you are provided for Assignment 1:

```python
def evaluate(expression, state):
...

    case Variable(variable_name=variable_name):
      value = state.get_value(variable_name)
      if value == None:
        raise InterpSyntaxError(f"Cannot read from {variable_name} before assignment.")
      return (*value, state)
```

At this point in the code we are in a function named evaluate whose first parameter is the next expression to evaluate and whose second parameter is a state. Does that sound familiar? That's because it's the same as a _configuration_! We use _pattern matching_ to select the code to execute. The pattern is based on the structure of `expression` and we match in the code above when `expression` is a variable access. Refer to Pattern Matching in Python for the exact form of the syntax. The _state_ variable is an instance of the `State` object that provides a method called `get_value` (see Assignment 1: Implementing STIMPL for more information about that function) that returns a tuple of (v, τ) In other words, get\_value works the same as σ. So,

```python
value = state.get_value(variable_name)
```

is a means of implementing the premise of the operational semantics.

```python
      return (*value, state)
```

yields the final result! Pretty cool, right?

Let's do the same analysis for assignment:

\\(\frac{<e,\sigma>\longrightarrow(v,\tau,\sigma′),\sigma′(x)\longrightarrow(\*,\tau)}{<Assign(Variable(x),e),σ>\longrightarrow(v,\tau,σ′[(v,\tau)/x])}\\)

And here's the implementation:

```python
def evaluate(expression, state):
...

   case Assign(variable=variable, value=value):

      value_result, value_type, new_state = evaluate(value, state)

      variable_from_state = new_state.get_value(variable.variable_name)
      _, variable_type = variable_from_state if variable_from_state else (None, None)

      if value_type != variable_type and variable_type != None:
        raise InterpTypeError(f"""Mismatched types for Assignment:
            Cannot assign {value_type} to {variable_type}""")

      new_state = new_state.set_value(variable.variable_name, value_result, value_type)
      return (value_result, value_type, new_state)
```

First, look at

```python
      value_result, value_type, new_state = evaluate(value, state)
```

which is how we are able to find the values needed to satisfy the left-hand premise. value\_result is v, value\_type is τ
and new\_state is σ'.

```python
      variable_from_state = new_state.get_value(variable.variable_name)
```

is how we are able to find the values needed to satisfy the right-hand premise. Notice that we are using new\_state (σ') to get variable.variable\_name (x). There is some trickiness in\_, variable\_type = variable\_from\_state if variable\_from\_state else (None, None) to set things up in case we are doing the first assignment to the variable (which sets its type), so ignore that for now! Remember that in our premises we guaranteed that the type of the variable in state σ' matches the type of the expression:

```python
      if value_type != variable_type and variable_type != None:
        raise InterpTypeError(f"""Mismatched types for Assignment:
            Cannot assign {value_type} to {variable_type}""")
```

performs that check!

```python
      new_state = new_state.set_value(variable.variable_name, value_result, value_type)
```

generates a new, new state (σ′[(v,τ)/x]) and

```python

      return (value_result, value_type, new_state)
```

yields the final result!


## 9/22/2021 {#9-22-2021}

Like other popular newspapers that do in-depth analysis of popular topics (Links to an external site.), this edition of the Daily PL is part 2/2 of an investigative report on ...


### Formal Program Semantics {#formal-program-semantics}

In our previous class, we discussed the operational semantics of variable access and variable assignment. In this class we explored the operational semantics of the addition operator and the if/then statement.


#### A Quick Review of Concepts {#a-quick-review-of-concepts}

At all times, a program has a state. A state is just a function whose domain is the set of defined program variables and whose range is V \* T where V is the set of all valid variable values (e.g., 5, 6.0, True, "Hello", etc) and T is the set of all valid variable types (e.g., Integer, Floating Point, Boolean, String, etc). ​In other words, you can ask a state about a particular variable and, if it is defined, the function will return the variable's current value and its type.

Here is the formal definition of the state function:

\begin{equation\*}
\\(\sigma(x) = (v, \tau)​\\)
\end{equation\*}

The state function is denoted with the σ
. τ always represents some arbitrary variable type. Generally, v represents a value. So, you can read the definition above as "Variable x has value v and type τ in state σ."

Between execution steps, a program is always in a particular configuration:

\begin{equation\*}
<e, \sigma>
\end{equation\*}

This notation means that the program in state σ is about to evaluate expression e.

A program step is an atomic (indivisible) change from one program configuration to another. Operational semantics defines steps using rules. The general form of a rule is

\begin{equation\*}
\frac{premises}{conclusion}
\end{equation\*}

The conclusion is generally written like <e, σ> ⟶ (v, τ, σ) which means that when the premises hold, the expression e evaluated in state σ evaluates to a value (v), type (τ) and (possibly modified) state (σ') after a single step of execution.


#### Defining the Semantics of the Addition Expression {#defining-the-semantics-of-the-addition-expression}

In STIMPL, the expression to "add" two values n1 and n2 is written like Add(n1, n2). By the rules of the STIMPL language, for an addition to be possible, n1 and n2 must

1.  have the same type and
2.  have Integer, Floating Point or String type.

Because every unit in STIMPL has a value, we will define the operational semantics using two arbitrary expressions, e1 and e2. The program configuration to which we are giving semantics is

\begin{equation\*}
<Add(e\_1),e\_2),\sigma>
\end{equation\*}

Because our addition operator applies when its operands are three different types, we technically need three different rules for its evaluation. Let's start with the operational semantics for add when its operands are of type Integer:

\begin{equation\*}
\frac{<e\_1,\sigma>⟶(v\_1,Integer,\sigma),<e\_2,\sigma>⟶(v\_2,Integer,\sigma \prime)}{<Add(e1,e2),σ>⟶(v1+v2,Integer,\sigma\prime)}
\end{equation\*}

Let's look at the premises. First, there is

\begin{equation\*}
<e\_1,\sigma>⟶(v1,Integer,\sigma \prime)
\end{equation\*}

which means that, when evaluated in state σ, expression e1 has the value v1 and type Integer and may modify the state (to σ'). Notice that we are not using τ for the resulting type of the evaluation? Why? Because using τ indicates that this rule applies when the evaluation of e1 in state σ evaluates to any type (which we "assign" to τ in case we want to use it again in a later premise). Instead, we are explicitly writing Integer which indicates that this rule only defines the operational semantics for Add(e1, e2) in state σ when the expression e1 evaluates to a value of type Integer in state σ

.

As for the second premise

\begin{equation\*}
<e\_2,\sigma \prime>⟶(v\_2,Integer,\sigma\prime \prime)
\end{equation\*}

we see something very similar. Again, our premise prescribes that, when evaluated in state σ' (note the ' there), e2's type is an Integer. It is for this reason that we can be satisfied that this rule only applies when the types of the Add's operands match and are integers! We "thread through" the (possibly) modified σ' when evaluating e2 to enforce the STIMPL language's definition that operands are evaluated strictly left-to-right.

As for the conclusion,

\begin{equation\*}
(v\_1+v\_2,Integer,\sigma \prime \prime)
\end{equation\*}

shows the value of this expression. We will assume here that + works as expected for two integers. Because the operands are integers, we can definitively write that the type of the addition will be an integer, too. We use σ'' as the resulting state because it's possible that evaluation of the expressions of both e1 and e2 caused side effects.

The rule that we defined covers only the operational semantics for addition of two integers. The other cases (for floating-point and string types) are almost copy/paste.

Now, how does that translate to an actual implementation?

```python

def evaluate(expression, state):
  match expression:
  ...

  case Add(left=left, right=right):
      result = 0
      left_result, left_type, new_state = evaluate(left, state)
      right_result, right_type, new_state = evaluate(right, new_state)

      if left_type != right_type:
        raise InterpTypeError(f"""Mismatched types for Add:
            Cannot add {left_type} to {right_type}""")

      match left_type:
        case Integer() | String() | FloatingPoint():
          result = left_result + right_result
        case _:
          raise InterpTypeError(f"""Cannot add {left_type}s""")

      return (result, left_type, new_state)
```

In this snippet, the local variables left and right are the equivalent of e1 and e2, respectively, in the operational semantics. After initializing a variable to store the result, the evaluation of the premises is accomplished. new\_state matches σ'' after being assigned and reassigned in those two evaluations. Next, the code checks to make sure that the types of the operands matches. Finally, if the types of the operands is an integer, then the result is just a traditional addition (+ in Python).

You can see the implementation for the other types mixed in this code as well. Convince yourself that the code above handles all the different cases where an Add is valid in STIMPL.


#### Defining the Semantics of the If/Then/Else Expression {#defining-the-semantics-of-the-if-then-else-expression}

In STIMPL, we write an If/Then/Else expression like If(c, t, f) where c is any boolean-typed expression, t is the expression to evaluate if the value of c is true and f is the expression to evaluate if the value of c is false. The value/type/updated state of the entire expression is the value/type/updated state that results from evaluating t when c is true and the value/type/updated state that results from evaluating f when c is false. This means that we are required to write two different rules to completely define the operational semantics of the If/Then/Else expression: one for the case where c is true and the other for the case when c is false. Sounds like the template that we used for the Add expression, doesn't it? Because the two cases are almost the same, we will only go through writing the rule for when the condition is true:

\begin{equation\*}
\frac{<c,\sigma>\longrightarrow(True,Boolean,\sigma \prime),<t,\sigma \prime>\longrightarrow(v,\tau,\sigma\prime \prime)}{<If(c,t,f),σ>⟶(v,\tau, \sigma \prime \prime)}
\end{equation\*}

As in the premises for the operational semantics of the Add operator, the first premise in the operational semantics above uses literals to guarantee that the rule only applies in certain cases:

\begin{equation\*}
<c,\sigma \prime>\longrightarrow(True,Boolean,\sigma\prime \prime)
\end{equation\*}

means that the rule only applies when c, evaluated in state σ, has a value of True and a boolean type. We use the second premise

\begin{equation\*}
<t,\sigma\prime>⟶(v,\tau,\sigma \prime \prime)
\end{equation\*}

to "get" some values that we will use in the conclusion. v and τ
are the value and the type, respectively, of t when it is evaluated in state σ'. Note that we evaluate t in state σ' because the evaluation of the condition statement may have modified state σ and we want to thread that through. Evaluation of t in state σ' may modify σ', generating σ''. The combination of these premises are combined to define that the entire expression evaluates to

\begin{equation\*}
(v,\tau,\sigma\prime \prime)
\end{equation\*}

Again, the pattern is the same for writing the operational semantics when the condition is false.

Let's look at how this translates into actual working code:

```python
def evaluate(expression, state):
  match expression:
  ...

    case If(condition=condition, true=true, false=false):
      condition_value, condition_type, new_state = evaluate(condition, state)

      if not isinstance(condition_type, Boolean):
        raise InterpTypeError("Cannot branch on non-boolean value!")

      result_value = None
      result_type = None

      if condition_value:
        result_value, result_type, new_state = evaluate(true, new_state)
      else:
        result_value, result_type, new_state = evaluate(false, new_state)

      return (result_value, result_type, new_state)
```

The local variables `condition`, `true` and `false` match c, t and f, respectively from the rule in the operational semantics. The first step in the implementation is to determine the value/type/updated state when c is evaluated in state σ. Immediately after doing that, the code checks to make sure that the condition statement has boolean type. Remember how our rule only applies when this is the case? Next, depending on whether the condition evaluated to true or false, the appropriate next expression is evaluated in the σ' state (`new_state`). It is the result of that evaluation that is the ultimate value of the expression and what is returned.


## 9/24/2021 {#9-24-2021}

As we conclude the penultimate week of September, we are turning the page from imperative programming and beginning our work on object-oriented programming!


### The Definitions of Object-Oriented Programming {#the-definitions-of-object-oriented-programming}

We started off by attempting to describe object-oriented programming using two different definitions:

1.  A language with support for abstraction of abstract data types (ADTs).​ (from Sebesta)
2.  A language with support for objects, containers of data (attributes, properties, fields, etc.) and code (methods).​ (from Wikipedia (Links to an external site.))

As graduates of CS1021C and CS1080C, the second definition is probably not surprising. The first definition, however, leaves something to be desired. Using Definition (1) means that we have to a) know the definition of abstraction and abstract data types and b) know what it means to apply abstraction to ADTs.


### Abstraction (Reprise) {#abstraction--reprise}

There are two fundamental types of abstractions in programming: process and data. We have talked about the former but the latter is new. When we talked previously about process abstractions, we did attempt to define the term abstraction but it was not satisfying.

Sebesta formally defines abstraction as the view or representation of an entity that includes only the most significant attributes. This definition seems to align with our notion of abstraction especially the way we use the term in phrases like "abstract away the details." It didn't feel like a good definition to me until I thought of it this way:

Consider that you and I are both humans. As humans, we are both carbon based and have to breath to survive. But, we may not have the same color hair. I can say that I have red hair and you have blue hair to point out the significant attributes that distinguish us. I need not say that we are both carbon based and have to breath to survive because we are both human and we have abstracted those facts into our common humanity.

We returned to this point at the end of class when we described how inheritance is the mechanism of object-oriented programming that provides abstraction over ADTs.
Abstract Data Types (ADTs)

Next, we talked about the second form of abstraction available to programmers: data abstraction. As functions, procedures and methods are the syntactic and semantic means of abstracting processes in programming languages, ADTs are the syntactic and semantic means of abstracting data in programming languages. ADTs combine (encapsulate) data (usually called the ADT's attributes, properties, etc) and operations that operate on that data (usually called the ADT's methods) into a single entity.

We discussed that hiding is a significant advantage of ADTs. ADTs hide the data being represented and allow that data's manipulation only through pre-defined methods, the ADT's interface. The interface typically gives the ADT's user the ability to manipulate/access the data internal to the type and perform other semantically meaningful operations (e.g., sorting a list).

We brainstormed some common ADTs:

1.  Stack
2.  Queue
3.  List
4.  Array
5.  Dictionary
6.  Graph
7.  Tree

These are are so-called user-defined ADTs because they are defined by the user of a programming language and composed of primitive data types.

Next, we tackled the question of whether primitives are a type of ADT. A primitive type like floating point numbers would seem to meet the definition of an abstract data type:

1.  It's underlying representation is hidden from the user (the programmer does not care whether FPs are represented according to IEEE754 or some other specification)
2.  There are operations that manipulate the data (addition, subtraction, multiplation, division).


### The Requirements of an Object-Oriented Programming Language {#the-requirements-of-an-object-oriented-programming-language}

ADTs are just one of the three requirements that your textbook's author believes are required for a language to be considered object oriented. Sebesta believes that, in addition to ADTs, an object-oriented programming language requires support for inheritance and dynamic method binding.


#### Inheritance {#inheritance}

It is inheritance where OOPs provide abstraction for ADTs. Inheritance allows programmers to abstract ADTs into common classes that share common characteristics. Consider three ADTs that we identified: trees, linked lists and graphs. These three ADTs all have nodes (of some kind or another) which means that we could abstract them into a common class: node-based things. A graph would inherit from the node-based things ADT so that its implementer could concentrate on what makes it distinct -- its edges, etc.

Don't worry if that is too theoretical. It does not negate the fact that, through inheritance, we are able to implement hierarchies that can be "read" using "is a" the way that inheritance is usually defined. With inheritance, cats inherit from mammals and "a cat is a mammal".

Subclasses inherit from ancestor classes. In Java, ancestor classes are called superclasses and subclasses are called, well, subclasses. In C++, ancestor classes are called base classes and subclasses are called derived classes. Subclasses inherit both data and methods.


#### Dynamic Method Binding {#dynamic-method-binding}

In an OOP, a variable that is typed as Class A can be assigned anything that is actually a Class A or subclass thereof. We have not officially covered this yet, but in OOP a subclass can redefine a method defined in its ancestor.

Assume that every mammal can make a noise. That means that every dog can make a noise just like every cat can make a noise. Those noises do not need to be the same, though. So, a cat "overrides" the mammal's default noise and implements their own (meow). A dog does likewise (bark). A programmer can define a variable that holds a mammal and that variable can contain either a dog or a cat. When the programmer invokes the method that causes the mammal to make noise, then the appropriate method must be called depending on the actual type in the variable at the time. If the mammal held a dog, it would bark. If the mammal held a cat, it would meow.

This resolution of methods at runtime is known as dynamic method binding.


#### OOP Example with Inheritance and Dynamic Method Binding {#oop-example-with-inheritance-and-dynamic-method-binding}

```java

abstract class Mammal {
  protected int legs = 0;
  Mammal() {
    legs = 0;
  }
  abstract void makeNoise();
}

class Dog extends Mammal {
  Dog() {
    super();
    legs = 4;
  }
  void makeNoise() {
    System.out.println("bark");
  }
}

class Cat extends Mammal {
  Cat() {
    super();
    legs = 4;
  }

  void makeNoise() {
    System.out.println("meow");
  }
}

public class MammalDemo {
  static void makeARuckus(Mammal m) {
    m.makeNoise();
  }
  public static void main(String args[]) {
    Dog fido = new Dog();
    Cat checkers = new Cat();

    makeARuckus(fido);
    makeARuckus(checkers);
  }
}
```

This code creates a hierarchy with Mammal at the top as the superclass of both the Dog and the Cat. In other words, Dog and Cat inherit from Mammal. The abstract keyword before class Mammal indicates that Mammal is a class that cannot be directly instantiated. We will come back to that later. The Mammal class declares that there is a method that each of its subclasses must implement -- the makeNoise function. If a subclass of Mammal fails to implement that function, it will not compile. The good news is that Cat and Dog do both implement that function and define behavior in accordance with their personality!

The function makeARuckus has a parameter whose type is a Mammal. As we said above, in OOP that means that I can assign to that variable a Mammal or anything that inherits from Mammal. When we call makeARuckus with an argument whose type is Dog, the function relies of dynamic method binding to make sure that the proper makeNoise function is called -- the one that barks -- even though makeARuckus does not know whether m is a generic Mammal, a Dog or a Cat. It is because of dynamic method binding that the code above generates

```text
bark
meow
```

as output.


## 9/27/2021 {#9-27-2021}

It's the last week of September but the first full week of OOP. Let's do this!


### Overriding in OOP {#overriding-in-oop}

Recall the concept of inheritance that we discussed in the last class. Besides its utility as a formalism that describes the way a language supports abstraction of ADTs (and, therefore, makes it a plausibly OO language), inheritance provides a practical benefit in software engineering. Namely, it allows developers to build hierarchies of types.

Hierarchies are composed of pairs of classes -- one is the superclass and the other is the subclass. A superclass could conceivably be itself a subclass. A subclass could itself be a superclass. In terms of a family tree, we could say that the subclass is a descendant of the superclass (Note: remember that the terms superclass and subclass are not always the ones used by the languages themselves; C++ refers to them as base and derived classes, respectively).

A subclass inherits both the data and methods from its superclass(es). However, as Sebesta says, "... the features and capabilities of the [superclass] are not quite right for the new use." Overriding methods allows the programmer to keep most of the functionality of the baseclass and customize the parts that are "not quite right."

An overridden method is defined in a subclass and replaces the method with the same name (and usually protocol) in the parent.

The official documentation and tutorials for Java describe overriding in the language this way:["An instance method in a subclass with the same signature (name, plus the number and the type of its parameters) and return type as an instance method in the superclass overrides the superclass's method."](https://docs.oracle.com/javase/tutorial/java/IandI/override.html)  The exact rules for overriding methods in Java are [online at the language specification](https://docs.oracle.com/javase/specs/jls/se7/html/jls-8.html#jls-8.4.8.1) .

Let's make it concrete with an example:

```java

class Car {
  protected boolean electric = false;
  protected int wheels = 4;

  Car() {
  }

  boolean ignite() {
      System.out.println("Igniting a generic car's engine!");
      return true;
  }
}

class Tesla extends Car {
  Tesla() {
    super();
    electric = true;
  }

  @Override
  boolean ignite() {
    System.out.println("Igniting a Tesla's engine!");
    return true;
  }
}

class Chevrolet extends Car {
  Chevrolet() {
    super();
  }

  @Override
  boolean ignite() {
    System.out.println("Igniting a Chevrolet's engine!");
    return false;
  }
}
```

In this example, Car is the superclass of Tesla and Chevrolet. The Car class defines a method named ignite. That method will ignite the engine of the car -- an action whose mechanics differ based on the car's type. In other words, this is a perfect candidate for overriding. Both Tesla and Chevrolet implement a method with the same name, return value and parameters, thereby meeting Java's requirements for overriding. In Java, the `@Override` is known as an annotation. Annotations are ["a form of metadata [that] provide data about a program that is not part of the program itself."](https://docs.oracle.com/javase/tutorial/java/annotations/)  Annotations in Java are attached to particular syntactic units. In this case, the @Override annotation is attached to a method and it tells the compiler that the method is overriding a method from its superclass. If the compiler does not find a method in the superclass(es) that is capable of being overridden by the method, an error is generated. This is a good check for the programmer. (Note: C++ offers similar functionality through the override specifier (Links to an external site.).)

Let's say that the programmer actually implemented the Tesla class like this:

```java

class Tesla extends Car {
  Tesla() {
    super();
    electric = true;
  }

  @Override
  boolean ignite(int testing) {
    super.ignite();
    System.out.println("Igniting a Tesla's engine!");
    return true;
  }
}
```

The ignite method implemented in Tesla does not override the ignite method from Car because it has a different set of parameters. The `@Override` annotation tells the compiler that the programmer thought they were overriding something. An error is generated and the programmer can make the appropriate fix. Without the `@Override` annotation, the code will compile but produce incorrect output when executed.

Assume that the following program exists:

```java

public class CarDemo {
  public static void main(String args[]) {
    Car c = new Car();
    Car t = new Tesla();
    Car v = new Chevrolet();

    c.ignite();
    t.ignite();
    v.ignite();
  }
}
```

This code instantiates three different cars -- the first is a generic Car, the second is a Tesla and the third is a Chevrolet. Look carefully and note that the type of each of the three is actually stored in a variable whose type is Car and not a more-specific type (ie, Tesla or Chevy). This is not a problem because of dynamic dispatch. At runtime, the JVM will find the proper ignite function and invoke it according to the variable's actual type and not its static type. Because ignite is overridden by Chevy and Tesla, the output of the program above is:

```text
Igniting a generic car's engine!
Igniting a Tesla's engine!
Igniting a Chevrolet's engine!
```

Most OOP languages provide the programmer the option to invoke the method they are overriding from the superclass. Java is no different. If an overriding method implementation wants to invoke the functionality of the method that it is overriding, it can do so using the super keyword.

```java

class Tesla extends Car {
  Tesla() {
    super();
    electric = true;
  }

  @Override
  boolean ignite() {
    super.ignite();
    System.out.println("Igniting a Tesla's engine!");
    return true;
  }
}

class Chevrolet extends Car {
  Chevrolet() {
    super();
  }

  @Override
  boolean ignite() {
    super.ignite();
    System.out.println("Igniting a Chevrolet's engine!");
    return false;
  }
}
```

With these changes, the program now outputs:

```text
Igniting a generic car's engine!
Igniting a generic car's engine!
Igniting a Tesla's engine!
Igniting a generic car's engine!
Igniting a Chevrolet's engine!
```

**New material alert:** What if the programmer does not want a subclass to be able to customize the behavior of a certain method? For example, no matter how you subclass Dog, it's noise method is always going to bark -- no inheriting class should change that. Java provides the `final` keyword to guarantee that the implementation of a method cannot be overridden by a subclass. Let's change the code for the classes from above to look like this:

```java

class Car {
  protected boolean electric = false;
  protected int wheels = 4;

  Car() {
  }

  void start() {
    System.out.println("Starting a car ...");
    if (this.ignite()) {
      System.out.println("Ignited the engine!");
    } else {
      System.out.println("Did NOT ignite the engine!");
    }
  }

  final boolean ignite() {
      System.out.println("Igniting a generic car's engine!");
      return true;
  }
}

class Tesla extends Car {
  Tesla() {
    super();
    electric = true;
  }

  @Override
  boolean ignite() {
    super.ignite();
    System.out.println("Igniting a Tesla's engine!");
    return true;
  }
}

class Chevrolet extends Car {
  Chevrolet() {
    super();
  }

  @Override
  boolean ignite() {
    super.ignite();
    System.out.println("Igniting a Chevrolet's engine!");
    return false;
  }
}
```

Notice that `ignite` in the Car class has a `final` before the return type. This makes `ignite` a [final method](https://docs.oracle.com/javase/specs/jls/se7/html/jls-8.html#jls-8.4.3.3) : "A method can be declared final to prevent subclasses from overriding or hiding it". (C++ has something similar -- [the final specifier](https://en.cppreference.com/w/cpp/language/final) .) Attempting to compile the code above produces this output:

```text

CarDemo.java:30: error: ignite() in Tesla cannot override ignite() in Car
  boolean ignite() {
          ^
  overridden method is final
CarDemo.java:43: error: ignite() in Chevrolet cannot override ignite() in Car
  boolean ignite() {
          ^
  overridden method is final
2 errors
```


### Subclass vs Subtype {#subclass-vs-subtype}

In OOP there is fascinating distinction between subclasses and subtypes. All those classes that inherit from other classes are considered subclasses. However, they are not all subtypes. For a type/class S to be a subtype of type/class T, the following must hold

Assume that ϕ(t)
is some provable property that is true of t, an object of type T. Then ϕ(s)

must be true as well for s, an object of type S.

This formal definition can be phrased simply in terms of behaviors: If it is possible to pass objects of type T as arguments to a function that expects objects of type S without any change in the behavior, then S is a subtype of T. In other words, a subtype behaves exactly like the "supertype".

Barbara Liskov who pioneered the definition and study of subtypes put it this way (Links to an external site.): "If for each object o1 of type S there is an object o2 of type T such that for all programs P defined in terms of T, the behavior of P is unchanged when o1 is substituted for o2, then S is a subtype of T."


### Open Recursion {#open-recursion}

Open recursion in an OO PL is a fancy term for the combination of a) functionality that gives the programmer the ability to refer to the current object from within a method (usually through a variable named this or self) and b) dynamic dispatch. . Thanks to open recursion, some method A of class C can call some method B of the same class. But wait, there's more! (Links to an external site.) Continuing our example, in open recursion, if method B is overriden in class D (a subclass of C), then the overriden version of the method is invoked when called from method A on an object of type D even though method A is only implemented by class C. Wild! It is far easier to see this work in real life than talk about it abstractly. So, consider our cars again:

```java
class Car {
  protected boolean electric = false;
  protected int wheels = 4;

  Car() {
  }

  void start() {
    System.out.println("Starting a car ...");
    if (this.ignite()) {
      System.out.println("Ignited the engine!");
    } else {
      System.out.println("Did NOT ignite the engine!");
    }
  }

  boolean ignite() {
      System.out.println("Igniting a generic car's engine!");
      return true;
  }
}

class Tesla extends Car {
  Tesla() {
    super();
    electric = true;
  }

  @Override
  boolean ignite() {
    System.out.println("Igniting a Tesla's engine!");
    return true;
  }
}

class Chevrolet extends Car {
  Chevrolet() {
    super();
  }

  @Override
  boolean ignite() {
    System.out.println("Igniting a Chevrolet's engine!");
    return false;
  }
}
```

The start method is only implemented in the Car class. At the time that it is compiled, the Car class has no awareness of any subclasses (ie, Tesla and Chevrolet). Let's run this code and see what happens:

```java

public class CarDemo {
  public static void main(String args[]) {
    Car c = new Car();
    Car t = new Tesla();
    Car v = new Chevrolet();

    c.start();
    t.start();
    v.start();
  }
}
```

Here's the output:

```text
Starting a car ...
Igniting a generic car's engine!
Ignited the engine!
Starting a car ...
Igniting a Tesla's engine!
Ignited the engine!
Starting a car ...
Igniting a Chevrolet's engine!
Did NOT ignite the engine!
```

Wow! Even though the implementation of start is entirely within the Car class and the Car class knows nothing about the Tesla or Chevrolet subclasses, when the start method is invoked on object's of those types, the call to this's ignite method triggers the execution of code specific to the type of car!

How cool is that?


## 10/1/2021 {#10-1-2021}

Original is [here](https://uc.instructure.com/courses/1476336/pages/the-daily-pl-10-slash-1-slash-2021?module%5Fitem%5Fid=65427045).

We made it into October!! Spooky, spooky!


### Corrections {#corrections}

Like in real newspapers (Links to an external site.), we are going to start including Corrections in each edition! We want to make sure that our reporters adhere to the highest standards:

**The JVM will** insert an implicit call to the to-be-instantiated class' default constructor (i.e., the one with no parameters) if the the to-be-constructed (sub)class does not do so explicitly. We'll make this clear with an example:

```java

class Parent {
  Parent() {
    System.out.println("I am in the Parent constructor.");
  }

  Parent(int parameter) {
    System.out.println("This version of the constructor is not called.");
  }
}

class Child extends Parent {
  Child() {
    /*
     * No explicit call to super -- one is automatically
     * injected to the parent constructor with no parameters.
     */
    System.out.println("I am in the Child constructor.");
  }
}

public class DefaultConstructor {
  public static void main(String args[]) {
    Child c = new Child();
  }
}
```

When this program is executed, it will print

```text
I am in the Parent constructor.
I am in the Child constructor.
```

The main function is instantiating an object of the type Child. We can visually inspect that there is no explicit call the super() from within the Child class' constructor. Therefore, the JVM will insert an implicit call to super() which actually invokes Parent().

However, if we make the following change:

```java
class Parent {
  Parent() {
    System.out.println("I am in the Parent constructor.");
  }

  Parent(int parameter) {
    System.out.println("This version of the constructor is not called.");
  }
}

class Child extends Parent {
  Child() {
    /*
     * No explicit call to super -- one is automatically
     * injected to the parent constructor with no parameters.
     */
    super(1);
    System.out.println("I am in the Child constructor.");
  }
}

public class DefaultConstructor {
  public static void main(String args[]) {
    Child c = new Child();
  }
}
```

Something different happens. We see that there is a call to Child's superclass' constructor (the one that takes a single int-typed parameter). That means that the JVM will not insert an implicit call to super() and we will get the following output:

This version of the constructor is not called.
I am in the Child constructor.

The C++ standard sanctions a main function without a return statement. The standard says: "if control reaches the end of main without encountering a return statement, the effect is that of executing return 0;."


### A Different Way to OOP {#a-different-way-to-oop}

So far we have talked about OOP in the context of Java. Java, and languages like it, are called Class-based OOP languages. In a Class-based OOP, classes and objects exist in different worlds. Classes are used to define/declare

1.  the attributes and methods of an encapsulation, and
2.  the relationships between them.

From these classes, objects are instantiated that contain those attributes and methods and respect the defined/declared hierarchy. We can see this in the example given above: The classes Parent and Child define (no) attributes and (no) methods and define the relationship between them. In main(), a Child is instantiated and stored in the variable c. c is an object of type Child that contains all the data associated with a Child and a Parent and can perform all the actions of a Child and a Parent.

Nothing about Class-based OOP should be different than what you've learned in the past as you've worked with C++. There are several problems with Class-based OOP.

1.  The supported attributes and method of each class must be determined before the application is developed (once the code is compiled and the system is running, an object cannot add, remove or modify its own methods or attributes);
2.  The inheritance hierarchy between classes must be determined before the application is developed (once the code is compiled, changing the relationship between classes will require that the application be recompiled!).

In other words, Class-based OOP does not allow the structure of the Classes (nor their relationships) to easily evolve with the implementation of a system.

There is another way, though. It's called Prototypal OOP. The most commonly known languages that use Prototypal OOP are JavaScript and Ruby! In Prototypal (which is a very hard word to spell!) OOP there is no distinction between Class and object -- everything is an object! In a Prototypal OOP there is a base object that has no methods or data attributes and every object is able to modify itself (its attributes and methods). To build a new object, the programmer simply copies from an existing object, the new object's so-called prototype, and customizes the copied object appropriately.

For example, assume that there is an object called Car that has one attribute (the number of wheels) and one method (start). That object can serve as the prototype car. To "instantiate" a new Car, the programmer simply copies the existing prototypical car object Car and gives it a name, say, c. The programmer can change the value of c's number of wheels and invoke its method, start. Let's say that the same programmer wants to create something akin to a subclass of Car. The programmer would create a new, completely fresh object (one that has no methods or attributes), name it, say, Tesla, and link the new prototype Tesla object to the existing prototype car Car object through the prototype Tesla object's prototype link (the sequence of links that connects prototype objects to one another is called a prototype chain). If a Tesla has attributes (range, etc) or methods (self\_drive) that the prototype car does not, then the programmer would install those methods on the prototype Tesla Tesla. Finally, the programmer would "declare" that the Tesla object is a prototype Tesla.

{{< figure src="/ox-hugo/4.png" >}}

The blue arrows in the diagram above are prototype links. The orange lines indicate where a copy is made.

How does inheritance work in such a model? Well, it's actually pretty straightforward: When a method is invoked or an attribute is read/assigned, the runtime will search the prototype chain for the first prototypical object that has such a method or attribute. Mic drop. In the diagram above, let's follow how this would play out when the programmer calls start() on the Model 3 Instance. The Model 3 Instance does not contain a method named start. So, up we go! The Tesla Prototype Object does not contain that me either. All the way up! The Car Prototype Object, does, however, so that method is executed!

What would it look like to override a function? Again, relatively straightforward. If a Tesla performs different behavior than a normal Car when it starts, the programmer creating the Tesla Prototype Object would just add a method to that object with the name start. Then, when the prototype chain is traversed by the runtime looking for the method, it will stop at the start method defined in the Tesla Prototype Object instead of continuing on to the start method in the Car Prototype Object. (The same is true of attributes!)

There is (at least) one really powerful feature of this model. Keep in mind that the prototype objects are real things that can be manipulated at runtime (unlike classes which do not really exist after compilation) and prototype objects are linked together to achieve a type of inheritance. With reference to the diagram above, say the programmer changes the definition of the start method on the Car Prototype Object. With only that change, any object whose prototype chain includes the Car Prototype Object will immediately have that new functionality (where it is not otherwise overridden, obviously) -- all without stopping the system!! How cool is that?

How scary is that? Can you imagine working on a system where certain methods you "inherit" change at runtime?

{{< figure src="/ox-hugo/1.jpg" >}}


### OOP or Interfaces? {#oop-or-interfaces}

Newer languages (e.g., Go, Rust, (new versions of) Java) are experimenting with new features that support one of the "killer apps" of OOP: The ability to define a function that takes a parameter of type A but that works just the same as long as it is called with an argument whose type is a subtype of A. The function doesn't have care whether it is called with an argument whose type is A or some subtype of A because the language's OOP semantics guarantee that anything the programmer can do with an object of type A, the programmer can do with and object of subtype of A.

Unfortunately, using OOP to accomplish such a feat may be like killing a fly with a bazooka (or a laptop, like Alex killed that wasp today).

Instead, modern languages are using a slimmer mechanism known as an interface or a trait. An interface just defines a list of methods that an implementer of that interface must support. Let's see some real Go code that does this -- it'll clear things up:

```java

type Readable interface {
  Read()
}
```

This snippet defines an interface with one function (Read) that takes no parameters and returns no value. That interface is named Readable. Simple.

```java

type Book struct {
  title string
}
```

This snippet defines a data structure called a Book -- such structs are the closest that Go has to classes.

```java

func (book Book) Read() {
  fmt.Printf("Reading the book %v\n", book.title)
}
```

This snippet simply says that if variable b is of type Book then the programmer can call b.Read(). Now, for the payoff:

```java

func WhatAreYouReading(r Readable) {
  r.Read()
}
```

This function only accepts arguments that implement (i.e., meet the criteria specified in the definition of) the Readable interface. In other words, with this definition, the code in the body of the function can safely assume that it can can call Read on r. And, for the encore:

```java

  book := Book{title: "Infinite Jest"}
  WhatAreYouReading(book)
```

This code works exactly like you'd expect. book is a valid argument to WhatAreYouReading because it implements the Read method which, implicitly, means that it implements the Readable interface. But, what's really cool is that the programmer never had to say explicitly that Book implements the Readable interface! The compiler checks automatically. This gives the programmer the ability to generate a list of only the methods absolutely necessary for its parameters to implement to achieve the necessary ends -- and nothing unnecessary. Further, it decouples the person implementing a function from the person using the function -- those two parties do not have to coordinate requirements beforehand. Finally, this functionality means that a structure can implement as few or as many interfaces as its designer wants.


### Dip Our Toe Into the Pool of Pointers {#dip-our-toe-into-the-pool-of-pointers}

We only had a few minutes to start pointers, but we did make some headway. There will be more on this in the next lecture!

It is important to remember that pointers are like any other type -- they have a range of valid values and a set of valid operations that you can perform on those values. What are the range of valid values for a pointer? All valid memory addresses. And what are the valid operations? Addition, subtraction, dereference and assignment.

{{< figure src="/ox-hugo/5.png" >}}

In the diagram, the gray area is the memory of the computer. The blue box is a pointer. It points to the gold area of memory. It is important to remember that pointers and their targets both exist in memory! In fact, in true Inception  (Links to an external site.)style, a pointer can pointer to a pointer!

At the same time that pointers are types, they also have types. The type of a pointer includes the type of the target object. In other words, if the memory in the gold box held an object of type T, the the green box's type would be "pointer to type T." If the programmer dereferences the blue pointer, they will get access to the object in memory in the gold.

In an ideal scenario, it would always be the case that the type of the pointer and the type of the object at the target of the pointer are the same.  However, that's not always the case. Come to the next lecture to see what can go wrong when that simple fact fails to hold!


## 10/4/2021 {#10-4-2021}

Original is [here](https://uc.instructure.com/courses/1476336/pages/the-daily-pl-10-slash-4-slash-2021?module%5Fitem%5Fid=65438167)
One day closer to Candy Corn!


### Corrections {#corrections}

When we were discussing the nature of the type of pointers, we specified that the range of valid values for a pointer are all memory addresses. In some languages this may be true. However, some other languages specify that the range of valid values for a pointer are all memory addresses and a special null value that explicitly specifies a pointer does not point to a target.

We also discussed the operations that you can perform on a pointer-type variable. What we omitted was a discussion of an operation that will fetch the address of a variable in memory. For languages that use pointers to support indirect addressing (see below), such an operation is required. In C/C++, this operation is performed using the address of (&) operator.


### Pointers {#pointers}

We continued the discussion of pointers that we started on Friday! On Friday we discussed that pointers are just like any other type -- they have valid values and defined operations that the programmer can perform on those values.


#### The Pros of Pointers {#the-pros-of-pointers}

Though a very famous and influential computer scientist (Links to an external site.) once called his invention of null references a "billion dollar mistake" (he low balled it, I think!), the presence and power of pointers in a language is important for at least two reasons:

1.  Without pointers, the programmer could not utilize the power of indirection.
2.  Pointers give the programmer the power to address and manage heap-dynamic memory.

Indirection gives the programmer the power to link between different objects in memory -- something that makes writing certain data structures (like trees, graphs, linked lists, etc) easier. Management of heap-dynamic memory gives the programmer the ability to allocate, manipulate and deallocate memory at runtime. Without this power, the programmer would have to know before execution the amount of memory their program will require.


#### The Cons of Pointers {#the-cons-of-pointers}

Their use as a means of indirection and managing heap-dynamic memory are powerful, but misusing either can cause serious problems.

<!--list-separator-->

-  Possible Problems when Using Pointers for Indirection

    As we said in the last lecture, as long as a pointer targets memory that contains the expected type of object, everything is a-okay. Problems arise, however, when the target of the pointer is an area in memory that does not contain an object of the expected type (including garbage) and/or the pointer targets an area of memory that is inaccessible to the program.

    The former problem can arise when code in a program writes to areas of memory beyond their control (this behavior is usually an error, but is very common). It can also arise because of a use after free. As the name implies, a use-after-free error occurs when a program uses memory after it has been freed. There are two common scenarios that give rise to a use after free:

    1.  Scenario 1:
        1.  One part of a program (part A) frees an area of memory that held a variable of type T that it no longer needs
        2.  Another part of the program (part B) has a pointer to that very memory
        3.  A third part of the program (part C) overwrites that "freed" area of memory with a variable of type S
        4.  Part B accesses the memory assuming that it still holds a variable of Type T
    2.  Scenario 2:
        1.  One part of a program (part A) frees an area of memory that held a variable of type T that it no longer needs
        2.  Part A never nullifies the pointer it used to point to that area of memory though the pointer is now invalid because the program has released the space
        3.  A second part of the program (part C) overwrites that "freed" area of memory with a variable of type S
        4.  Part A incorrectly accesses the memory using the invalid pointer assuming that it still holds a variable of Type T

    Scenario 2 is depicted visually in the following scenario and intimates why use-after-free errors are considered security vulnerabilities:

    {{< figure src="/ox-hugo/6.png" >}}

    In the example shown visually above, the program's use of the invalid pointer means that the user of the invalid pointer can now access an object that is at a higher privilege level (Restricted vs Regular) than the programmer intended. When the programmer calls a function through the invalid pointer they expect that a method on the Regular object will be called. Unfortunately, a method on the Restricted object will be called instead. Trouble!

    The latter problem occurs when a pointer targets memory beyond the program's control. This most often occurs when the program sets a variable's address to 0 (NULL, null, nil) to indicate that it is invalid but later uses that pointer without checking its validity. For compiled languages this often results in the dreaded segmentation fault and for interpreted languages it often results in other anomalous behavior (like Java's Null Pointer Exception (NPE)). Neither are good!

<!--list-separator-->

-  Possible Solutions

    Wouldn't it be nice if we had a way to make sure that the pointer being dereferenced is valid so we fall victim to some of the aforementioned problems? What would be the requirements of such a solution?

    1.  Pointers to areas of memory that have been deallocated cannot be dereferenced.
    2.  The type of the object at the target of a pointer always matches the programmer's expectation.

    Your author describes two potential ways of doing this. First, are tombstones. Tombstones are essentially an intermediary between a pointer and its target. When the programming language implements pointers and uses tombstones for protection, a new tombstone is allocated for each pointer the programmer generates. The programmer's pointer targets the tombstone and the tombstone targets the pointer's actual target. The tombstone also contains an extra bit of information: whether it is valid. When the programmer first instantiates a pointer to some target a the compiler/interpreter

    1.  generates a tombstone whose target is a
    2.  sets the valid bit of the tombstone to valid
    3.  points the programmer's pointer to the tombstone.

    When the programmer dereferences their pointer, the compiler/runtime will check to make sure that the target tombstone's valid flag is set to valid before doing the actual dereference of the ultimate target. When the programmer "destroys" the pointer (by releasing the memory at its target or by some other means), the compiler/runtime will set the target tombstone's valid flag to invalid. As a result, if the programmer later attempts to dereference the pointer after it was destroyed, the compiler/runtime will see that the tombstone's valid flag is invalid and generate an appropriate error.

    This process is depicted visually in the following diagram.

    Tombstones.png

    This seems like a great solution! Unfortunately, there are downsides. In order for the tombstone to provide protection for the entirety of the program's execution, once a tombstone has been allocated it cannot be reclaimed. It must remain in place forever because it is always possible that the programmer can incorrectly reuse an invalid pointer. As soon as the tombstone is deallocated, the protection that it provides is gone. The other problem is that the use of tombstones adds an additional layer of indirection to dereference a pointer and every indirection causes memory accesses. Though memory access times are small, they are not zero -- the cost of these additional memory accesses add up.

    What about a solution that does not require an additional level of indirection? There is a so-called lock-and-key technique. This protection method requires that the pointer hold an additional piece of information beyond the address of the target: the key. The memory at the target of the pointer is also required to hold a key. When the system allocates memory it sets the keys of the pointer and the target to be the same value. When the programmer dereferences a pointer, the two keys are compared and the operation is only allowed to continue if the keys are the same. The process is depicted visually below.

    {{< figure src="/ox-hugo/7.png" >}}

    With this technique, there is no additional memory access -- that's good! However, there are still downsides. First, there is a speed cost. For every dereference there must be a check of the equality of the keys. Depending on the length of the key that can take a significant amount of time. Second, there is a space cost. Every pointer and block of allocated memory now must have enough space to store the key. For systems where memory allocations are done in big chunks, the relative size overhead of storing, say, and 8byte key is not significant. However, if the system allocates many small areas of memory, the relative size overhead is tremendous. Moreover, the more heavily the system relies on pointers the more space will be used to store keys rather than meaningful data.

    Well, let's just make the keys smaller? Great idea. There's only one problem: The smaller the keys the fewer unique key values. Fewer unique key values mean that it is more likely an invalid pointer randomly points to a chunk of memory with a matching key. In this scenario, the protection afforded by the scheme is vitiated. (I just wanted to type that word -- I'm not even sure I am using it correctly!)


## 10/6/2021 {#10-6-2021}

Original is [here](https://uc.instructure.com/courses/1476336/pages/the-daily-pl-10-slash-6-slash-2021?module%5Fitem%5Fid=65458621).

I love Reese's Pieces.


### Corrections {#corrections}

None to speak of!!


### Pointers for Dynamic Memory Management {#pointers-for-dynamic-memory-management}

We finished up our discussion of pointers in today's class. In the previous class, we talked about how pointers have two important roles in programming languages:

1.  indirection -- referring to other objects
2.  dynamic memory management -- "handles" for areas of memory that are dynamically allocated and deallocated by the system.

On Monday we focused on the role of pointers in indirection and how to solve some of the problems that can arise from using pointers in that capacity. In today's class, we focused on the role of pointers in dynamic memory management.

As tools for dynamic memory management, the programmer can use pointers to target blocks (N.B.: I am using blocks as a generic term for memory and am not using it in the sense of a block [a.k.a. page] as defined in the context of operating systems) of dynamic memory that are allocated and deallocated by the operating system for use by an application. The programmer can use these pointers to manipulate what is stored in those blocks and, ultimately, release them back to the operating system when they are no longer needed.

Memory in the system is a finite resource. If a program repeatedly asks for memory from the system without releasing previous allocations back to the system, there will come a time when the memory is exhausted. In order to be able to release existing allocations back to the operating system for reuse by other applications, the programmer must not lose track of those existing allocations. When there is a memory allocation from the operating system to the application that can no longer be reached by a pointer in the application, that memory allocation is leaked. Because the application no longer has a pointer to it, there is no way for the application to release it back to the system. Leaked memory belongs to the leaking application until it terminates.

For some programs this is fine. Some applications run for a short, defined period of time. However, there are other programs (especially servers) that are written specifically to operate for extended periods of time. If such applications leak memory, they run the risk of exhausting the system's memory resources and failing (Links to an external site.).


#### Preventing Memory Leaks {#preventing-memory-leaks}

System behavior will be constrained when those systems are written in languages that do not support using pointers for dynamic memory management. However, what we learned (above) is that it is not always easy to use pointers for dynamic memory management correctly. What are some of the tools that programming languages provide to help the programmer manage pointers in their role as managers of dynamic memory.

<!--list-separator-->

-  Reference Counting

    In a reference-counted memory management system, each allocated block of memory given to the application by the system contains a reference count. That reference count, well, counts the number of references to the object. In other words, for every pointer to an operating-system allocated block of memory, the reference count on that block increases. Every time that a pointer's target is changed, the programming language updates the reference counts of the old target (decrement) and the new target (increment), if there is a new target (the pointer could be changed to null, in which case there is no new target). When a block's reference count reaches zero, the language knows that the block is no longer needed, and automatically returns it to the system! Pretty cool.

    {{< figure src="/ox-hugo/9.png" >}}

    The scenario depicted visually shows the reference counting process. At time (a), the programmer allocates a block of memory dynamically from the operating system and puts an application object in that block. Assume that the application object is a node in a linked list. The first node is the head of the list. Because the programmer has a pointer that targets that allocation, the block's reference count at time (a) is 1. At time (b), the programmer allocates a second block of memory dynamically from the system and puts a second application object in that block -- another node in the linked list (the tail of the list). Because the head of the list is referencing the tail of the list, the reference count of the tail is 1. At time (c) the programmer deletes their pointer (or reassigns it to a different target) to the head of the linked list. The programming language decrements the reference count of the block of memory holding the head node and deallocates it because the reference count has dropped to 0. Transitively, the pointer from the head application object to the tail application object is deleted and the programming language decrements the reference count of its target, the block of memory holding the tail application object (time (d)). The reference count of the block of memory holding the tail application object is now 0 and so the programming language automatically deallocates the associated storage (time (e)). Voila -- an automatic way to handle dynamic memory management.

    There's only one problem. What if the programmer wants to implement a circularly linked list?

    {{< figure src="/ox-hugo/10.png" >}}

    Because the tail node points to the head node, and the head node points to the tail node, even after the programmer's pointer to the head node is deleted or retargeted, the reference counts of the two nodes will never drop to 0. In other words, even with reference-counted automatic memory management, there could still be a memory leak! Although there are algorithms to break these cycles, it's important to remember that reference counting is not a panacea. Python is a language that manages memory using reference counting.


#### Garbage Collection {#garbage-collection}

Garbage collection (GC) is another method of automatically managing dynamically allocated memory. In a GC'd system, when a programmer allocates memory to store an object and no space is available, the programming language will stop the execution of the program (a so-called GC pause) to calculate which previously allocated memory blocks are no longer in use and can be returned to the system. Having freed up space as a result of cleaning up unused garbage, the allocation requested by the programmer can be satisfied and the execution of the program can continue.

The most efficient way to engineer a GC'd system is if the programming language allocates memory to the programmer in fixed-size cells. In this scenario, every allocation request from the programmer is satisfied by a block of memory from one of several banks of fixed-size blocks that are stacked back-to-back. For example, a programming language may manage three different banks -- one that holds reserves of X-sized blocks, one that holds reserves of Y-sized blocks and one that holds reserves of Z-sized blocks. When the programmer asks for memory to hold an object that is of size a, the programming language will deliver a block that is just big enough to that object. Because the size of the requested allocation may not be exactly the same size as one of the available fixed-size blocks, space may be wasted.

The fixed sizing of blocks in a GC'd system makes it easy/fast to walk through every block of memory. We will see shortly that the GC algorithm requires such an operation every time that it stops the program to do a cleanup. Without a consistent size, traversing the memory blocks would require that each block hold a tag indicating its size -- a waste of space and the cause of an additional memory read -- so that the algorithm could dynamically calculate the starting address of the next block.

When the programmer requests an allocation that cannot be satisfied, the programming language stops the execution of the program and does a garbage collection. The classic GC algorithm is called mark and sweep and has three steps:

Every block of memory is marked as free using a free bit attached to the block. Of course, this is only true of some of the blocks, but the GC is optimistic!
All pointers active at the time the program is paused are traced to their targets. The free bits of those blocks are reset.
The blocks that are marked free and released.

The process is shown visually below:

{{< figure src="/ox-hugo/11.png" >}}

At times (a), (b) and (c), the programmer is allocating and manipulating references to dynamically allocated memory. At time (c), the allocation request for variable z cannot be satisfied because there are no available blocks. A GC pause starts at time (d) and the mark-and-sweep algorithm commences by setting the free bit of every block. At time (e) the pointers are traced and the appropriate free bits are cleared. At time (f) the memory is released from the unused block and its free bit, too, is reset. At time (g) the allocation for variable z can be satisfied, the GC pause completes and the programming language restarts execution of the program.

This process seems great, just like reference counting seemed great. However, there is a significant problem: The programmer cannot predict when GC pauses will occur and the programmer cannot predict how long those pauses will take. A GC pause is completely initiated by the programming language and (usually) completely beyond the control of the programmer. Such random pauses of program execution could be extremely harmful to a system that is controlling a system that needs to keep up with interactions from the outside world. For instance, it would be totally unacceptable for an autopilot system to take an extremely long GC pause as it calculates the heading needed to land a plane. There are myriad other systems where pauses are inappropriate.

The mark-and-sweep algorithm described above is extremely naive and GC algorithms are the subject of intense research. Languages like go and Java manage memory with a GC and their algorithms are incredibly sophisticated. If you want to know more, please let me know!
