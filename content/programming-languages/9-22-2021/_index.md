+++
title = "9/22/2021"
author = ["David Lewis"]
draft = false
+++

Like other popular newspapers that do in-depth analysis of popular topics (Links to an external site.), this edition of the Daily PL is part 2/2 of an investigative report on ...


## Formal Program Semantics {#formal-program-semantics}

In our previous class, we discussed the operational semantics of variable access and variable assignment. In this class we explored the operational semantics of the addition operator and the if/then statement.


### A Quick Review of Concepts {#a-quick-review-of-concepts}

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


### Defining the Semantics of the Addition Expression {#defining-the-semantics-of-the-addition-expression}

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

```python

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


### Defining the Semantics of the If/Then/Else Expression {#defining-the-semantics-of-the-if-then-else-expression}

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

```python
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
