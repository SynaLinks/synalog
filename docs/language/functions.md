# Built-in functions

## String functions

| Function | Description |
|----------|-------------|
| `a ++ b` | Concatenation |
| `Substr(s, i, l)` | Substring (**1-based** index) |
| `Length(s)` | String length |
| `Upper(s)` / `Lower(s)` | Case conversion |
| `Split(s, sep)` | Split into an array at each `sep`, taken as text |
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

Integer literals are 32-bit on DuckDB, PostgreSQL, Trino, Presto and Databricks, where arithmetic past 2^31 on them fails (or, on Spark without ANSI mode, wraps around): make such arithmetic 64-bit with `ToInt64`, as in `ToInt64(1024) * 1024 * 1024 * 1024`.

| Function | Description |
|----------|-------------|
| `ToInt64(x)` | Cast to a 64-bit integer (a fraction is rounded) |
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
    in Synalog instead. For date/time math, use the `Substr` → `ToInt64` →
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

A function is a value: compare it to filter. Written as a condition, `IsEven(x)` would hold for every `x` (a function has a row for each argument, true or false), so the verifier refuses it:

```logica
IsEven(x) = (x % 2 == 0);
Even(x:) :- Numbers(x:), IsEven(x) == true;
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
