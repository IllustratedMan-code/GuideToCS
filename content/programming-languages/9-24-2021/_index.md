+++
title = "9/24/2021"
author = ["David Lewis"]
draft = false
+++

As we conclude the penultimate week of September, we are turning the page from imperative programming and beginning our work on object-oriented programming!


## The Definitions of Object-Oriented Programming {#the-definitions-of-object-oriented-programming}

We started off by attempting to describe object-oriented programming using two different definitions:

1.  A language with support for abstraction of abstract data types (ADTs).​ (from Sebesta)
2.  A language with support for objects, containers of data (attributes, properties, fields, etc.) and code (methods).​ (from Wikipedia (Links to an external site.))

As graduates of CS1021C and CS1080C, the second definition is probably not surprising. The first definition, however, leaves something to be desired. Using Definition (1) means that we have to a) know the definition of abstraction and abstract data types and b) know what it means to apply abstraction to ADTs.


## Abstraction (Reprise) {#abstraction--reprise}

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


## The Requirements of an Object-Oriented Programming Language {#the-requirements-of-an-object-oriented-programming-language}

ADTs are just one of the three requirements that your textbook's author believes are required for a language to be considered object oriented. Sebesta believes that, in addition to ADTs, an object-oriented programming language requires support for inheritance and dynamic method binding.


### Inheritance {#inheritance}

It is inheritance where OOPs provide abstraction for ADTs. Inheritance allows programmers to abstract ADTs into common classes that share common characteristics. Consider three ADTs that we identified: trees, linked lists and graphs. These three ADTs all have nodes (of some kind or another) which means that we could abstract them into a common class: node-based things. A graph would inherit from the node-based things ADT so that its implementer could concentrate on what makes it distinct -- its edges, etc.

Don't worry if that is too theoretical. It does not negate the fact that, through inheritance, we are able to implement hierarchies that can be "read" using "is a" the way that inheritance is usually defined. With inheritance, cats inherit from mammals and "a cat is a mammal".

Subclasses inherit from ancestor classes. In Java, ancestor classes are called superclasses and subclasses are called, well, subclasses. In C++, ancestor classes are called base classes and subclasses are called derived classes. Subclasses inherit both data and methods.


### Dynamic Method Binding {#dynamic-method-binding}

In an OOP, a variable that is typed as Class A can be assigned anything that is actually a Class A or subclass thereof. We have not officially covered this yet, but in OOP a subclass can redefine a method defined in its ancestor.

Assume that every mammal can make a noise. That means that every dog can make a noise just like every cat can make a noise. Those noises do not need to be the same, though. So, a cat "overrides" the mammal's default noise and implements their own (meow). A dog does likewise (bark). A programmer can define a variable that holds a mammal and that variable can contain either a dog or a cat. When the programmer invokes the method that causes the mammal to make noise, then the appropriate method must be called depending on the actual type in the variable at the time. If the mammal held a dog, it would bark. If the mammal held a cat, it would meow.

This resolution of methods at runtime is known as dynamic method binding.


### OOP Example with Inheritance and Dynamic Method Binding {#oop-example-with-inheritance-and-dynamic-method-binding}

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
