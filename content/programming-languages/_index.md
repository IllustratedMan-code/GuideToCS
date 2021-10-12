+++
title = "Programming Languages"
author = ["David Lewis"]
draft = false
+++

Programming Languages


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

```jupyter-python
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

```jupyter-python
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


#### Consider this ... {#consider-this-dot-dot-dot}

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


#### Dynamic Scoping {#dynamic-scoping}

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

```jupyter-python
def evaluate(expression, state):
...

    case Variable(variable_name=variable_name):
      value = state.get_value(variable_name)
      if value == None:
        raise InterpSyntaxError(f"Cannot read from {variable_name} before assignment.")
      return (*value, state)
```

At this point in the code we are in a function named evaluate whose first parameter is the next expression to evaluate and whose second parameter is a state. Does that sound familiar? That's because it's the same as a _configuration_! We use _pattern matching_ to select the code to execute. The pattern is based on the structure of `expression` and we match in the code above when `expression` is a variable access. Refer to Pattern Matching in Python for the exact form of the syntax. The _state_ variable is an instance of the `State` object that provides a method called `get_value` (see Assignment 1: Implementing STIMPL for more information about that function) that returns a tuple of (v, τ) In other words, get\_value works the same as σ. So,

```jupyter-python
value = state.get_value(variable_name)
```

is a means of implementing the premise of the operational semantics.

```jupyter-python
      return (*value, state)
```

yields the final result! Pretty cool, right?

Let's do the same analysis for assignment:

\\(\frac{<e,\sigma>\longrightarrow(v,\tau,\sigma′),\sigma′(x)\longrightarrow(\*,\tau)}{<Assign(Variable(x),e),σ>\longrightarrow(v,\tau,σ′[(v,\tau)/x])}\\)

And here's the implementation:

```jupyter-python
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

```jupyter-python
      value_result, value_type, new_state = evaluate(value, state)
```

which is how we are able to find the values needed to satisfy the left-hand premise. value\_result is v, value\_type is τ
and new\_state is σ'.

```jupyter-python
      variable_from_state = new_state.get_value(variable.variable_name)
```

is how we are able to find the values needed to satisfy the right-hand premise. Notice that we are using new\_state (σ') to get variable.variable\_name (x). There is some trickiness in\_, variable\_type = variable\_from\_state if variable\_from\_state else (None, None) to set things up in case we are doing the first assignment to the variable (which sets its type), so ignore that for now! Remember that in our premises we guaranteed that the type of the variable in state σ' matches the type of the expression:

```jupyter-python
      if value_type != variable_type and variable_type != None:
        raise InterpTypeError(f"""Mismatched types for Assignment:
            Cannot assign {value_type} to {variable_type}""")
```

performs that check!

```jupyter-python
      new_state = new_state.set_value(variable.variable_name, value_result, value_type)
```

generates a new, new state (σ′[(v,τ)/x]) and

```jupyter-python

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

```jupyter-python

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

```jupyter-python
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


## 9/27/2021 {#9-27-2021}


## 10/1/2021 {#10-1-2021}


## 10/4/2021 {#10-4-2021}


## 10/6/2021 {#10-6-2021}
