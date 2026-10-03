# Verification

Unlike Logica, which lets the database raise errors at execution time, Synalog embeds a **formal verifier** that catches issues at compile time before any SQL is generated, and before anything touches a database.

This matters most for AI agents: it prevents producing programs that parse correctly but fail at execution time, a common failure mode when generating SQL directly.

## Checks

| Check | What it detects |
|-------|-----------------|
| **Safety** | Head variables not bound in the body |
| **Safe negation** | Negated variables without a positive occurrence |
| **Safe aggregation** | Aggregated variables not bound outside the aggregate |
| **Stratification** | Negative recursion cycles |
| **Arity** | Predicates used with inconsistent argument counts |
| **Recursion** | Missing base cases, trivial loops, unbounded recursion without `@Recursive` |
| **Reserved names** | Rules that redefine a built-in library predicate (`Num`, `Str`, `ArgMin`, `Today`, `Now`, ...) |
| **Unsafe `SqlExpr`** | User rules that reach for the raw-SQL escape hatch |
| **Ordering** | A file whose front matter names a predicate, without an `@OrderBy` for it |
| **Front matter** | A file with front matter but no `name`, or no `description` (or an empty one) |
| **Assertions** | An `@Assert` statement that does not parse or contradicts the program, an assertion stated twice |

### Unsafe `SqlExpr`

`SqlExpr("...", {...})` injects a raw SQL string straight into the compiled query: unparsed, untyped, unverified and rarely portable across engines, defeating the guarantees Synalog exists to provide. It is reserved for the built-in library (which uses it for `ArgMin`/`ArgMax`/regex/...); user programs that call it are rejected:

```python
errors, warnings = synalog.check('''
  TenMinutesAgo(timestamp:) :-
    Now(timestamp: now),
    timestamp == SqlExpr("{t} - INTERVAL 10 MINUTE", {t: now});
''')
# errors: ["Unsafe SqlExpr in rule 'TenMinutesAgo': raw SQL bypasses verification and portability"]
```

The safe alternative is to express the logic in Synalog. For date/time math, stay on the string→int pipeline (`Substr` → `ToInt64` → `ToString`); see [temporal data](language/temporal.md#relative-dates-and-times).

### Ordering

A file whose front matter names a predicate (`name: TopCustomers`) is about that predicate: it is what runs, and its results are read page by page. Without `@OrderBy`, rows come back in whatever order the engine picks, so the same page differs between runs. The named predicate must be ordered; the file's helpers need not be, and a program without front matter is not checked.

```python
errors, warnings = synalog.check('''---
name: TopCustomers
---
Spent(customer_id:, spent:) :- customer_id in Range(3), spent == 1;
TopCustomers(customer_id:) :- Spent(customer_id:);
''')
# errors: ['Missing @OrderBy for 'TopCustomers', the predicate this file is about: ... add @OrderBy(TopCustomers, "column"); before its rules']
```

### Front matter

Front matter is how a file says what it is: `name` is the predicate it is about — the one that runs — and `description` what that predicate's rows are, the words someone searches for to find it. A file that opens front matter must give both, as text: a missing, blank or non-text `name` or `description` is refused. The `name` must also be a predicate the file defines (a parse error otherwise) and orders (see [Ordering](#ordering)). A program without front matter is not checked.

```python
errors, warnings = synalog.check('''---
name: TopCustomers
---
@OrderBy(TopCustomers, "customer_id");
TopCustomers(customer_id:) :- customer_id in Range(3);
''')
# errors: ["The front matter has no description for 'TopCustomers': say what its rows are — in the words someone would search for (description: ...)"]
```

## Assertions

`@Assert` states what a predicate must satisfy, in first-order logic, and Synalog checks it against the data by searching for counterexamples:

```logica
@Assert(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");
```

The verifier rejects an assertion that does not parse, applies a predicate to the wrong number of arguments, or is stated twice, and warns about one that cannot be checked against a database. Inside a connected project, `check()` also runs the assertions and reports each violated one as an error. See [Assertions](assertions.md).

## Usage

Verification runs through [`check()`](python-api.md#check):

```python
import synalog

bad_source = """
Test(x:, y:) :- Numbers(x:);
"""

errors, warnings = synalog.check(bad_source)
for e in errors:
    print(e)
# Unbound variable 'y' in head of rule: Test(x:, y:) :- Numbers(x:)
```

`check()` returns the errors and the warnings as two lists. No error means the program is structurally valid and safe to compile; warnings do not make it invalid.

!!! tip "Check before you compile"
    In an agent loop, always run `check()` first and feed the error messages back to the model. The messages are written to be actionable: they name the predicate, the variable, and the violated rule.

## Complete example

An intentionally invalid program (an unbound head variable, an unbounded self-recursion and a reserved predicate name), and everything the verifier reports for it:

```logica
--8<-- "docs/examples/verification.l"
```

??? example "Verifier output"

    ```text
    --8<-- "docs/examples/verification.log"
    ```
