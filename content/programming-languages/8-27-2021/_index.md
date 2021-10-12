+++
title = "8/27/2021"
author = ["David Lewis"]
draft = false
+++

## Programming Paradigms {#programming-paradigms}

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


## Language Evaluation Criteria (New Material Alert) {#language-evaluation-criteria--new-material-alert}

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
