+++
title = "10/29/2021"
author = ["David Lewis"]
draft = false
+++

## No one Puts Locals In a Corner {#no-one-puts-locals-in-a-corner}

One of the really cool things about functional programming languages is their first-class support for functions. In functional programming languages, the programmer can pass functions as parameters to other functions and return functions from functions. Let's take a closer look at functions that "generate" other functions. JavaScript has the capability to return functions from functions so we'll use that language to explore:

```javascript
function urlGenerator(prefix) {
  function return_function(url) {
    return prefix + "://" + url;
  }
  return return_function;
}
```

The urlGenerator function takes a single parameter -- prefix. The caller of urlGenerator passes the protocol prefix as the argument (probably either "http" or "https"). The return value of urlGenerator is itself a function that takes a single parameter, a url, and returns url prepended with the prefix specified by the call to urlGenerator. An example might help:

```javascript
const httpsUrlGenerator = urlGenerator("https");
const httpUrlGenerator = urlGenerator("http");

console.log(httpsUrlGenerator("google.com"));
console.log(httpUrlGenerator("google.com"));
```

generates

```nil
"https://google.com"
"http://google.com"
```

In other words, the definition of httpsUrlGenerator is (conceptually)

```javascript
  function httpsUrlGenerator(url) {
    return "https" + "://" + url;
  }
```

and the definition of httpUrlGenerator is (conceptually)

```javascript
  function httpUrlGenerator(url) {
    return "http" + "://" + url;
  }
```

But that's only a conceptual definition! The real definition continues to contain prefix:

```javascript
    return prefix + "://" + url;
```

But, prefix is locally scoped to the urlGenerator function. So, how can httpUrlGenerator and httpsUrlGenerator continue to use its value after leaving the scope of urlGenerator?


## The Walls Are Closing In {#the-walls-are-closing-in}

JavaScript, and other languages like it, have the concept of closures. A closure is a context that travels with a function returned by another function. Inside the closure are values for the free variables (remember that definition?) of the returned function. In urlGenerator, the returned function (return\_function) uses the free variable prefix. Therefore, the closure associated with return\_function contains the value of prefix at the time the closure is created!

In the example above, there are two different copies of return\_function generated -- one when urlGenerator is called with the argument "http" and one when urlGenerator is called with the parameter "https". Visually, the situation is

{{< figure src="/ox-hugo/Closures.png" >}}


## Connections with Other Material {#connections-with-other-material}

Think about the connection between closures and the format of the urlGenerator/return\_function functions and other concepts we've explored previously like partial application and currying.
