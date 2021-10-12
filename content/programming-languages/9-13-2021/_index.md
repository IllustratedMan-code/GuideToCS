+++
title = "9/13/2021"
author = ["David Lewis"]
draft = false
+++

In today's edition of the Daily PL we will recap our discussion from today that covered subprograms, polymorphism and coroutines!


## Subprograms {#subprograms}

A _subprogram_ is a type of abstraction. It is process abstraction where the how of a process is hidden from the user who concerns themselves only with the what. A subprogram provides process abstraction by naming a collection of statements that define parameterized computations.​ Again, the collection of statements determines how the process is implemented. Subprogram parameters give the user the ability to control the way that the process executes. There are three types of subprograms:

1.  Procedure: A subprogram that does not return a value.
2.  Function: A subprogram that does return a value.
3.  Method: A subprogram that operates with an implicit association to an object; a method may or may not return a value.

Pay close attention to the book's explanation and definitions of terms like parameter, parameter profile, argument, protocol, definition, and declaration.

Subprograms are characterized by three facts:

1.  A subprogram has only one entry point
2.  Only one subprogram is active at any time
3.  Program execution returns to the caller upon completion


## Polymorphism {#polymorphism}

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


## Coroutines {#coroutines}

Just when you thought that you were getting the hang of subprograms, a new kid steps on the block: coroutines. Sebesta defines coroutines as a subprogram that cooperates with a caller. The first time that a programmer uses a coroutine, they call it at which point program execution is transferred to the statements of the coroutine. The coroutine executes until it yields control. The coroutine may yield control back to its caller or to another coroutine. When the coroutine yields control, it does not cease to exist -- it simply goes dormant. When the coroutine is again invoked -- resumed -- the coroutine begins executing where it previously yielded. In other words, coroutines have

1.  multiple entry points
2.  full control over execution until they yield
3.  the property that only one is active at a time (although many may be dormant)

Coroutines could be used to write a card game. Each player is a coroutine that knows about the player to their left (that is, a coroutine). The PlayerA coroutine performs their actions (perhaps drawing a card from the deck, etc) and checks to see if they won. If they did not win, then the PlayerA coroutine yields to the PlayerB coroutine who performs the same set of actions. This process continues until a player no longer has someone to their left. At that point, everything unwinds back to the point where PlayerA was last resumed -- the signal that a round is complete. The process continues by resuming PlayerA to start another round of the game. Because each player is a coroutine, it never ceased to exist and, therefore, retains information about previous draws from the deck. When a player finally wins, the process completes. To see this in code, check out  [cardgame.py](https://github.com/hawkinsw/cs3003/blob/main/subprograms/cardgame.py) .
