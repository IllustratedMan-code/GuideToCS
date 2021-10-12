+++
title = "8/30/2021"
author = ["David Lewis"]
draft = false
+++

Today we learned a more complete definition of imperative programming languages and studied the defining characteristics of variables. Unfortunately we did not get as far as I wanted during the class which means that there is some new material in this edition of the Daily PL!


## Imperative Programming Languages {#imperative-programming-languages}

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


## Variables {#variables}

There are 6 attributes of variables. Remember, though, that a variable is an abstraction of a memory cell.

1.  _type_: Collection of a variable's valid data values and the collection of valid operations on those values.
2.  _name_: String of characters used to identify the variable in the program's source code.
3.  _scope_: The range of statements in a program in which a variable is visible.
    Using the yet-to-be-defined concept of binding, there is an alternative definition: The range of statements where the name's binding to the variable is active.
4.  _lifetime_: The period of time during program execution when a variable is associated with computer memory.
5.  _address_: The place in memory where a variable's contents (value) are stored. This is sometimes called the variable's l-value because only a variable associated with an address can be placed on the left side of an assignment operator.
6.  _value_: The contents of the variable. The value is sometimes call the variable's r-value because a variable with a value can be used on the right side of an assignment operator.


## Looking forward to Binding (New Material Alert) {#looking-forward-to-binding--new-material-alert}

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
