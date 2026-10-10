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
| `Like(s, pattern)` | SQL pattern match: `%` any text, `_` one character, a backslash escapes them (`"50\%"`) |
| `Format(fmt, ...)` | printf-style formatting |
| `StartsWith(s, p)` / `EndsWith(s, p)` | Whether `s` starts / ends with `p` |
| `Strpos(s, p)` | Position of `p` in `s` (**1-based**), 0 when absent |
| `Lpad(s, n, p)` / `Rpad(s, n, p)` | `s` padded with `p` on the left / right to `n` characters (cut to `n` when longer) |
| `Repeat(s, n)` | `s` repeated `n` times |
| `Replace(s, a, b)` | Every `a` in `s` replaced by `b` |
| `Trim(s)` | `s` without leading and trailing spaces |
| `Ltrim(s)` / `Rtrim(s)` | `s` without leading / trailing spaces |
| `Reverse(s)` | The characters of `s` in reverse order |
| `RegexpContains(s, r)` | Whether the regular expression `r` matches in `s` |
| `RegexpExtract(s, r)` | The first match of `r` in `s`, null when none |
| `RegexpReplace(s, r, b)` | Every match of `r` in `s` replaced by `b` |

## Array functions

| Function | Description |
|----------|-------------|
| `Size(a)` | Number of elements |
| `Element(a, i)` | Element access (**0-based** index); null below 0 or past the end |
| `ArrayConcat(a, b)` | Concatenate arrays |
| `Range(n)` | Array `[0, 1, ..., n-1]`, empty for 0 or less |

`Size` of an empty list is 0, of a null list null. `Split("", ",")` is one empty part, `[""]`, and `Join` of an empty list is the empty text.

## Math functions

`Abs`, `Floor`, `Ceil`, `Round`, `Sqrt`, `Exp`, `Log` (natural), `Sin`, `Cos`, `Pow(x, y)` (`x` to the power `y`, a double, as `x ^ y`).

`Greatest(x, y, ...)` and `Least(x, y, ...)` are the greatest and least of their arguments, and null when one is null, as any arithmetic of a null is: `Greatest(x, Coalesce(y, 0))` skips a null `y`.

`Round(x)` rounds a half away from zero (`Round(2.5)` is 3, `Round(-2.5)` is -3). `Round(x, digits)` rounds the number as its text shows it, at 15 significant digits, half away from zero, as a spreadsheet does: `Round(1.005, 2)` is 1.01 and `Round(2.675, 2)` is 2.68 on every engine, though the doubles nearest 1.005 and 2.675 are just below them; a negative number of digits rounds to tens, hundreds, ... (`Round(1234, -2)` is 1200).

## Type casting

Integer literals are 32-bit on DuckDB, PostgreSQL, Trino, Presto and Databricks, where arithmetic past 2^31 on them fails (or, on Spark without ANSI mode, wraps around): make such arithmetic 64-bit with `ToInt64`, as in `ToInt64(1024) * 1024 * 1024 * 1024`.

| Function | Description |
|----------|-------------|
| `ToInt64(x)` | Cast to a 64-bit integer (a fraction is rounded) |
| `ToFloat64(x)` | Cast to float |
| `ToString(x)` | Cast to string. A number's text is the same on every engine: a whole number has no decimal point (`5`, every digit below 10^18); any other is the number as written (the shortest text that reads back as the same double) rounded half away from zero to 15 significant digits but at most 15 decimals, in plain decimal, without trailing zeros (`ToString(0.1 + 0.2)` is `"0.3"`, `ToString(1 / 3)` is `"0.333333333333333"`, `ToString(342547.0843250365)` is `"342547.084325037"`, `ToString(1e20)` is `"100000000000000000000"`) |

## Other

| Function | Description |
|----------|-------------|
| `IsNull(x)` | Null test as an expression |
| `Coalesce(x, y, ...)` | First non-null argument |
| `Ifnull(x, y)` | `x`, or `y` when `x` is null |
| `If(c, a, b)` | `a` when `c` holds, else `b` |
| `Trunc(x)` | `x` without its fraction (toward zero) |
| `Div(a, b)` | The whole quotient of `a` by `b` (toward zero) |
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

The functions listed on this page run, and give the same result, on every engine. A call of a function that the program does not define and that is not a built-in is refused by the verifier (`Undefined function 'Substrr' ... did you mean 'Substr'?`): it would otherwise read a table of that name.

## User-defined functions

Define pure functions with `=`:

```synalog
Square(x) = x * x;
FullName(first, last) = first ++ " " ++ last;
```

A function may not take the name of a built-in function (`Upper`, `Size`, `Pow`, ...): it would change what the name means in the whole program, and the verifier refuses it. A relation may (`Rank(x:)`): it is never called as a function.

```synalog
Greeting(message:) :- Users(first_name:, last_name:),
  message == "Hello, " ++ FullName(first_name, last_name) ++ "!";
```

A function can have a body: its value is the one the body binds, as a rule's head value is. A body that reads a table makes a lookup, which joins: a row with no match gets no value, so the rule using it gives no row for it (write a [`combine`](aggregation.md#combine-an-aggregate-as-a-value) to get a null instead):

```synalog
Inc(x) = n :- n == x + 1;
RateOf(currency) = rate :- ExchangeRate(currency:, rate:);
Converted(order_id:, eur: amount * RateOf(currency)) :- Orders(order_id:, amount:, currency:);
```

A function can return a record, read with a dot: `Point(x) = {x:, y: x * x};` then `Point(3).y` is 9.

A function is a value: compare it to filter. Written as a condition, `IsEven(x)` would hold for every `x` (a function has a row for each argument, true or false), so the verifier refuses it:

```synalog
IsEven(x) = (x % 2 == 0);
Even(x:) :- Numbers(x:), IsEven(x) == true;
```

## Complete example

String, math and casting functions, plus two user-defined functions:

```synalog
--8<-- "docs/examples/functions.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/functions.log"
    ```
