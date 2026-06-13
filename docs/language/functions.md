# Built-in functions

## String functions

| Function | Description |
|----------|-------------|
| `a ++ b` | Concatenation |
| `Substr(s, i, l)` | Substring (**1-based** index) |
| `Length(s)` | String length |
| `Upper(s)` / `Lower(s)` | Case conversion |
| `Split(s, sep)` | Split into an array |
| `Join(list, sep)` | Join array into a string |
| `Like(s, pattern)` | SQL pattern match (`%` wildcard) |
| `Format(fmt, ...)` | printf-style formatting |

## Array functions

| Function | Description |
|----------|-------------|
| `Size(a)` | Number of elements |
| `Element(a, i)` | Element access (**0-based** index) |
| `ArrayConcat(a, b)` | Concatenate arrays |
| `Range(n)` | Array `[0, 1, ..., n-1]` |

## Math functions

`Abs`, `Floor`, `Ceil`, `Round`, `Sqrt`, `Exp`, `Log`, `Sin`, `Cos`.

## Type casting

| Function | Description |
|----------|-------------|
| `ToInt64(x)` | Cast to integer |
| `ToFloat64(x)` | Cast to float |
| `ToString(x)` | Cast to string |

## Other

| Function | Description |
|----------|-------------|
| `IsNull(x)` | Null test as an expression |
| `Coalesce(x, y, ...)` | First non-null argument |
| `Constraint(expr)` | Filter rows by a boolean expression |

!!! warning "`SqlExpr` is reserved for the built-in library"
    `SqlExpr(s, r)` injects raw, unparsed, non-portable SQL into the compiled
    query, bypassing every verification and portability guarantee. It is used
    *internally* by the dialect library (e.g. `ArgMin`/`ArgMax`), but the
    [verifier rejects it in user programs](../verification.md). Express the logic
    in Synalog instead — for date/time math, use the `Substr` → `ToInt64` →
    `ToString` pipeline.

!!! note "Indexing conventions"
    `Substr` is **1-based** (SQL convention); `Element` is **0-based** (array convention).

## User-defined functions

Define pure functions with `=`:

```logica
Square(x) = x * x;
FullName(first, last) = first ++ " " ++ last;
```

```logica
Greeting(message:) :- Users(first_name:, last_name:),
  message == "Hello, " ++ FullName(first_name, last_name) ++ "!";
```

## Complete example

String, math and casting functions, plus two user-defined functions:

```logica
--8<-- "docs/examples/functions.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/functions.log"
    ```
