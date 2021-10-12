+++
title = "9/8/2021"
author = ["David Lewis"]
draft = false
+++

Welcome to The Daily PL for September 8, 2021. I'm not lying when I say that this is the best. edition. ever. There is new material included in this edition which will be covered in a forthcoming episode of PL After Dark. When that video is available, this post will be updated!


## Recap {#recap}

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


### Aggregate Data Types {#aggregate-data-types}

Aggregate data types are data types composed of one or more basic, or primitive, data types. Do not ask me to write a specific definition for primitive data type -- it will only get us into a circular mess :-)


## Array {#array}

An array is a homogeneous (i.e., all its elements must be of the same type) aggregate data type in which an individual element is accessed by its position (i.e., index) in the aggregate. There are myriad design decisions associated with a language's implementation of arrays (the type of the index, whether their size must be fixed or whether it can be dynamic, etc.) One of those design decisions is the way that a language lays out a two dimensional array in memory. There are two options: row-major order and column-major order. For a second, forget the concept of rows and columns altogether and consider that you access two dimensional arrays by letters and numbers. See the following diagram:

![](/ox-hugo/2.png)
The memory of actual computers is linear. Therefore, two dimensional arrays must be _flattened_. In "letter major" order, the slices of the array identified by letters are stored in memory one after the other. In "number major" order, the slices of the array identified by numbers are stored in memory one after another. Notice that, in "letter major" order, the numbers "change fastest" and that, in "number major" order, the letters "change fastest".

Substitute "row" for "letter" and "column" for "number" and, voila, you understand!! The C programming language stores arrays in row-major order; Fortran stores arrays in column-major order.

Keep in mind that this description is only one way (or many) to store two dimensional arrays. There are (Links to an external site.) others (Links to an external site.).


## Associative Arrays, Records, Tuples, Lists, Unions, Algebraic Data Types, Pattern Matching, List Comprehensions, and Equivalence {#associative-arrays-records-tuples-lists-unions-algebraic-data-types-pattern-matching-list-comprehensions-and-equivalence}

All that, and more, in Episode 2 of PL After Dark!

Note: In this video, I said that Python's Lists function as arrays and that Python does not have true arrays. Your book implies as much in the section on Lists. However, I went back to check, and it does appear that there is a standard module in Python that provides arrays, in certain cases. Take a look at the documentation here: [python arrays](https://docs.python.org/3/library/array.html) . The commonly used NumPy package also provides an array type: [numpy arrays](https://numpy.org/doc/stable/reference/generated/numpy.array.html) . While the language, per se, does not define an array type, the presence of the modules (particularly the former) is important to note. Sorry for the confusion!
