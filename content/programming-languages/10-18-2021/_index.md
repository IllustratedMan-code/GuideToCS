+++
title = "10/18/2021"
author = ["David Lewis"]
draft = false
+++

[Lambda lower now. How low can you go?](https://www.youtube.com/watch?v=gq7pxUgjLz0)


## Corrections {#corrections}

None to speak of!!


## (Recalling) Lambda Calculus {#recalling--lambda-calculus}

Remember that we said Lambda Calculus is the theoretical basis of functional programming languages in the same way that the Turing Machine is the theoretical basis of the imperative programming languages. Again, don't freak out when you hear the phrase "calculus". As we said in class, it is better to think of the Lambda Calculus as a programming language rather than a branch of mathematics.

Lambda Calculus is a model of computation defined entirely by function application. The Lambda Calculus is as powerful as a Turning Machine which means that anything computable can be computed in the Lambda Calculus. For a language as simple as the Lambda Calculus, that's remarkable!

Remember that the entirety of the Lambda Calculus is made up of a small number of entities:

1.  Expression: a name, a function or an application
2.  Function: \\(\lambda\\)<name> `.` <expression>
3.  Application: <expression> <expression>

We made the point in class that, without loss of generality, we will assume that all names are single letters from the alphabet. In other words, if you see two consecutive letters, e.g., ab, those are two separate names.


## Bound and Free Names and the Tao of Function Application {#bound-and-free-names-and-the-tao-of-function-application}

Because the entirety of the Lambda Calculus is function application, it is important that we get it exactly right. Let's recall the simplest example of function application:
\\((\lambda a. a)x = \left \lfloor x/a \right \rfloor a = x\\)
The \\(\lfloor x/a \rfloor a\\) means "replace all instances of a with x in whatever comes after the \\(\lfloor \rfloor\\) ".  This is so easy. What about this, though?

\\((\lambda a. \lambda b. ba)b\\)

The first thing to realize is that the _b_ in the expression that is the body of the nested lambda function is completely separate from the _b_ to which the lambda function is being applied. Why is that? Because the _b_ in the nested lambda function is the "parameter" to that function. So, what are we to do?

First, let's step back and consider the definitions of _free_ and _bound_ names. Loosely speaking, a name is _bound_ as soon as it is used as a parameter to a lambda function. It continues to be _bound_ in nested expressions _but may be rebound!_ For example,

\\(\lambda x. x \lambda x. x\\)

The "body" of the outer function is \\(x \lambda x . x\\) and the leftmost x is the x from the outer function's parameter. In other words,

\\((\lambda  x.x \lambda x.x) (a) = a \lambda x.x\\)

The substitution of a for x continues no further because x is rebound at the start of the nested lambda function. You will be relieved to know that,

\\(\lambda  x.x \lambda x.x  =  \lambda x.x \lambda a.a\\)

In fact, renaming like that has a special name: alpha conversion!

_Free_ names are those that are not bound.

Wow, that got pretty complicated pretty quickly! This is one case where some formalism actually improves the clarity of things, I think. Here is the formal definition of what it means for a name to be bound:

-   name is bound in \\(\lambda name\_1.expression\\) if name = name1 or name is bound in expression.
-   name is bound in \\(E\_1 E\_2\\) if name is bound in either \\(E\_1\\) or \\(E\_2\\).

Here is the formal definition of what it means for a name to be free:

-   name is free in name
-   name is free in \\(\lambda name\_1.expression\\) when name \\(\ne\\) name1 and name is free in expression
-   name is free in \\(E\_1E\_2\\) if name is free in either E1 or E2

Note that a name can be free and bound at the same time.

All this [hullabaloo](https://en.wiktionary.org/wiki/hullabaloo#English)  means that we need to be slightly more sophisticated in our function application. We have to check two boxes before assuming that can treat function application as a simple textual search/replace:

When applying \\(\lambda x. E\_1\\) to E2, we only replace the free instances of x in E1 with E2 and if E2 contains a free name that is bound in E1, we have to alpha convert that bound name in E1 to something that doesn't conflict. There is a good example of this in Section 1.2 of the XXXX that I will recreate here:

\\((\lambda x. (\lambda y . (x\lambda x. xy)))y\\)

First, note y (our E2 in this case) contains y (a free name) that is bound in \\((\lambda y. (x \lambda x.xy))\\)(our E1). In other words, before doing a straight substitution, we have to alpha convert the bound y in E1 to something that doesn't conflict. Let's choose t:

\\((\lambda x. (\lambda t. (x \lambda x.xt)))y\\)

Now we can do our substitution! But, be careful: x appears free in \\((\lambda y. (x \lambda x.xy)\\)
(again, our E1) one time -- its leftmost appearance! So, the substitution would yield:

\\((\lambda t. (y \lambda x.xt)\\)

Voila!


## Currying Functions {#currying-functions}

Currying is the process of turning a function that takes multiple parameters into a sequence of functions that each take a single parameter. Currying is only possible in languages that support high-order functions: functions that a) take functions as parameters, b) return functions or c) both. Python is such a language. Let's look at how you would write a function that calculates the sum of three numbers in Python:

```python
def sum3(a, b, c):
  return a + b + c
```

That makes perfect sense!

Let's see if we can Curry that function. Because a Curried function can only take one parameter and we are Currying a function with three parameters, it stands to reason that we are going to have to generate three different functions. Let's start with the first:

```python
def sum1(a):
  # Something?
```

What something are we going to do? Well, we are going to declare another function inside sum1, call it sum2, that takes a parameter and then use that as the return value of sum1! It looks something like this:

```python
def sum1(a):
  def sum2(b):
    pass
  return sum2
```

That means, if we call sum1 with a single parameter, the result is another function, one that takes a single parameter! So, we've knocked off two of the three parameters, now we need one more. So, let's write something like this:

```python
def sum1(a):
  def sum2(b):
    def sum3(c):
      pass
    return sum3
  return sum2
```

This means that if we call sum1 with a single parameter and call the result of that with a single parameter, the result is another function, one that also takes a single parameter! What do we want that innermost function to do? That's right: the summation! So, here's our final code:

```python
def sum1(a):
  def sum2(b):
    def sum3(c):
      return a + b + c
    return sum3
  return sum2
```

We've successfully Curried a three-parameter summation function! There's just one issue left to address? How can we possibly use a and b in the innermost function? Will, I thought you told us that Python was statically scoped! In order for this to work correctly, wouldn't Python have to have something magical and dynamic-scope-like? Well, yes! And, it does. It has closures.

When you return sum2 from the body of sum1, Python closes around the variables that are needed by any code in the implementation of the returned function. Because a is needed in the implementation of sum2 (the function returned by sum1), Python creates a closure around that function which includes the value of a at the time sum2 was returned. It is important to remember that every time sum2 is defined pursuant to an invocation of sum1, a new version of sum2 is returned with a new closure. This closure-creation process repeats when we return sum3 pursuant to an invocation of sum2 (which itself was generated as a result of an invocation of sum1)! Whew.

Because we Curried the sum3 function as sum1, we have to call them slightly differently:

```python
  sum3(1, 2, 3)
  sum1(1)(2)(3)
```

As we learn more about functional programming in Haskell, you will see this pattern more and more and it will become second nature.

The "good" news, if you can call it that, is that functions in the Lambda Calculus always exist in their Curried form. Prove it to yourself by looking back at the way we formally defined the Lambda Calculus.

But, because it is laborious to write all those \\(\lambda\\)s over and over, we will introduce a shorthand for functions in the Lambda Calculus that take more than one parameter:

\\(\lambda p\_1p\_2 ... p\_n.expression\\)

is a function with n parameters named p1 through pn (which are each one letter). Simply put,

\\(\lambda x . \lambda y.xy = \lambda xy.xy\\)

for example.


## Doing Something with Lambda Calculus {#doing-something-with-lambda-calculus}

Remember how we have stressed that you cannot name functions inside the Lambda Calculus but how I have stressed that does not mean we cannot give names to functions from outside the Lambda Calculus? Well, here's where it starts to pay off! We are going learn how to do boolean operations using the Lambda Calculus. Let's assume that anytime we see a lambda function that takes two parameters and reduces to the first, we call that T. When we see a lambda function that takes two parameters and reduces to the second, we call that F:

\\(T \equiv \lambda xy.x\\)

\\(F \equiv \lambda xy.y\\)

To reiterate, it is the form that matters. If we see

\\(\lambda ab.a\\)

that is T too! In what follows, I will type T and F to save myself from writing all those
\\(\lambda\\)s, but remember: T and F are just functions!!

Okay, let's do something boolean operations. We can define the and operation as

\\(\wedge = \lambda xy.xy F\\)

Let's give it a whirl. First, let's get on the same page: True and False is False.

\\(\wedge TF = (\lambda xy.xyF)TF = TFF = (\lambda xy.x) FF = F\\)

Awesome! Let's try another: True and True is True.

\\(\wedge TT = (\lambda xy.xyF)TT = TTF = (\lambda xy.x) TF = T\\)

We can define the or operation as

\\(\lor = \lambda xy.xTy\\)

Try your hand at working through a few examples and make sure you get the expected results!
