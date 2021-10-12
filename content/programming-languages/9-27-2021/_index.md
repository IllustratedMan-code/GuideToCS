+++
title = "9/27/2021"
author = ["David Lewis"]
draft = false
+++

It's the last week of September but the first full week of OOP. Let's do this!


## Overriding in OOP {#overriding-in-oop}

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


## Subclass vs Subtype {#subclass-vs-subtype}

In OOP there is fascinating distinction between subclasses and subtypes. All those classes that inherit from other classes are considered subclasses. However, they are not all subtypes. For a type/class S to be a subtype of type/class T, the following must hold

Assume that ϕ(t)
is some provable property that is true of t, an object of type T. Then ϕ(s)

must be true as well for s, an object of type S.

This formal definition can be phrased simply in terms of behaviors: If it is possible to pass objects of type T as arguments to a function that expects objects of type S without any change in the behavior, then S is a subtype of T. In other words, a subtype behaves exactly like the "supertype".

Barbara Liskov who pioneered the definition and study of subtypes put it this way (Links to an external site.): "If for each object o1 of type S there is an object o2 of type T such that for all programs P defined in terms of T, the behavior of P is unchanged when o1 is substituted for o2, then S is a subtype of T."


## Open Recursion {#open-recursion}

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
