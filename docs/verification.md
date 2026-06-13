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
| **Reserved names** | Rules that redefine a built-in library predicate (`Num`, `Str`, `ArgMin`, `CurrentDate`, ...) |

## Usage

Verification runs through [`check()`](python-api.md#check):

```python
import synalog

bad_source = """
Test(x:, y:) :- Numbers(x:);
"""

errors = synalog.check(bad_source)
for e in errors:
    print(e)
# Unbound variable 'y' in head of rule: Test(x:, y:) :- Numbers(x:)
```

An empty list means the program is structurally valid and safe to compile.

!!! tip "Check before you compile"
    In an agent loop, always run `check()` first and feed the error messages back to the model. The messages are written to be actionable — they name the predicate, the variable, and the violated rule.

## Complete example

An intentionally invalid program — an unbound head variable, an unbounded self-recursion and a reserved predicate name — and everything the verifier reports for it:

```logica
--8<-- "docs/examples/verification.l"
```

??? example "Verifier output"

    ```text
    --8<-- "docs/examples/verification.log"
    ```
