+++
title = "8/25/2021"
author = ["David Lewis"]
draft = false
+++

## The value of studying PLs {#the-value-of-studying-pls}

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


## Programming domains {#programming-domains}

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


## The John von Neumann Model of Computing {#the-john-von-neumann-model-of-computing}

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
