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

### Unsafe `SqlExpr`

`SqlExpr("...", {...})` injects a raw SQL string straight into the compiled query — unparsed, untyped, unverified, and rarely portable across engines, defeating the guarantees Synalog exists to provide. It is reserved for the built-in library (which uses it for `ArgMin`/`ArgMax`/regex/...); user programs that call it are rejected:

```python
errors = synalog.check('''
  TenMinutesAgo(timestamp:) :-
    Now(timestamp: now),
    timestamp == SqlExpr("{t} - INTERVAL 10 MINUTE", {t: now});
''')
# ["Unsafe SqlExpr in rule 'TenMinutesAgo': raw SQL bypasses verification and portability"]
```

The safe alternative is to express the logic in Synalog. For date/time math, stay on the string→int pipeline (`Substr` → `ToInt64` → `ToString`); see [temporal data](language/temporal.md#relative-dates-and-times).

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
