# Verification

Unlike Logica, which lets the database raise errors at execution time, Synalog embeds a **formal verifier** that catches issues at compile time before any SQL is generated, and before anything touches a database.

This matters most for AI agents: it prevents producing programs that parse correctly but fail at execution time, a common failure mode when generating SQL directly.

## Checks

| Check | What it detects |
|-------|-----------------|
| **Safety** | Head variables not bound in the body, and variables only tested (`x > 2`, `!flag`, `Like(s, "a%")`) but never given a value |
| **Safe negation** | Negated variables without a positive occurrence; a variable a negation binds and uses again (`~(A(id:, h:), h > 10)`) is the negation's own |
| **Safe aggregation** | Aggregated variables not bound outside the aggregate |
| **Stratification** | Negative recursion cycles |
| **Arity** | Predicates used with inconsistent argument counts, columns a predicate does not have (also inside a negation), a column named twice in a head |
| **Recursion** | Missing base cases, trivial loops, unbounded recursion without `@Recursive` |
| **Reserved names** | Rules that redefine a built-in library predicate (`Num`, `Str`, `ArgMin`, `Today`, `Now`, ...), or a function named like a built-in one (`Upper(s) = ...`) |
| **Unsafe `SqlExpr`** | User rules that reach for the raw-SQL escape hatch, or read a table whose name is not one (`` `(SELECT 1)` ``) |
| **Ordering** | A file whose front matter names a predicate, without an `@OrderBy` for it |
| **Front matter** | A file with front matter but no `name`, or no `description` (or an empty one) |
| **Functors** | A functor naming a predicate that does not exist, or an argument the applied predicate does not depend on: `F := Count(Nope: Odd)` when `Count` never reads `Nope` |
| **Directives** | `@OrderBy`, `@Limit`, `@Recursive` or `@Ground` about a predicate the program does not define; an `@OrderBy` item that is not a column of the predicate; an `@Limit` that is not a whole number of rows; an `@Recursive` depth below 1; `@AttachDatabase`, or `@Ground` with `copy_to_file`: a program opens and writes no file; `FlagValue("name")` of a flag no `@DefineFlag` defines |
| **Assertions** | An `@Assert` statement that does not parse or contradicts the program, an assertion stated twice |
| **Undefined function** | A call of a function neither defined in the program nor built in (`Substrr(s, 1, 2)`), with the closest name when one is near |
| **Aggregates** | An aggregate called where nothing aggregates: as a value (`Q(t: Sum(x))`) or in a condition (`x == Max(x)`); `ArgMaxK` or `ArgMinK` without the number of items to keep |
| **Disjunction inside** | A disjunction inside a negation `~(A \| B)` or a `combine`, which does not compile: its alternatives go in a predicate of their own |
| **Contradictions** (warning) | A rule whose comparisons can never all hold (`a < b, a >= b`; `x > 10, x < 5`; `k == 1, k == 2`), so it gives no row |

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

### Text never becomes SQL

A program's text reaches SQL only as values or as checked names, so no string can add a statement or change one:

- every string (a fact, a pattern for `Like` or `search`, a `Format`) is a literal in the engine's own escapes; on Databricks and BigQuery, whose literals take backslash escapes, a quote of the value is written `\u0022`, so a literal holds no quote but its own two, and whatever splits a script into statements finds its end;
- on PostgreSQL, a string with a backslash is an `E'...'` literal, read the same whatever `standard_conforming_strings` says;
- names (predicates, columns, fields) are identifiers, quoted when they are keywords; `@OrderBy` takes columns, `@Limit` a number, `@Dataset` a schema name of letters, digits, `_` and `-`: anything else is refused;
- `SqlExpr`, raw SQL, is refused in a program, and so is a table name that is not one: a table the program reads is a dotted path of names, or one in backticks whose parts may hold any letter, spaces and ``-'&#@+%:()`` (`` `my-project.sales.Ventes (2024)` ``), each part quoted for the engine — never what could end the quoting (`"`, a backtick, `\`), make a path or a URL (`/`, `*`, `?`) or name a variable (`$`);
- `${...}` in a string is text, also on Databricks, whose Spark substitutes `${var}` in a statement's text before parsing it (`${env:HOME}`): there a dollar in a string is written `\u0024`, and a name holds none; a flag is read with `FlagValue("name")`, which gives its value as a string;
- a program reaches no file, process or service: there is no `ReadFile`, `WriteFile` or `Intelligence`, no `@AttachDatabase`, no `copy_to_file`, and a table name opens none: once the files given to `execute` are loaded, its DuckDB session reads no file, installs no extension and takes no Python variable for a table (`secret.csv`, `"secret"."parquet"`), which DuckDB otherwise does (`tests/cli/test_file_access.py`);
- a grounded table lives in Synalog's dataset, also when `@Ground` names it: a program cannot drop or replace a table elsewhere.

`tests/programs/injection` holds the attempts this is checked against, on every engine.

### Contradictions

A rule whose conditions contradict each other gives no row, which is almost always a reversed comparison or a wrong constant. The verifier reads the comparisons a rule always applies (`<`, `<=`, `>`, `>=`, `==`, `!=` between variables and constants) and warns when they can never all hold: a cycle through a strict comparison, two different constants made equal, or two values both forced equal and required to differ. A rule with a disjunction is reported only when every branch contradicts itself. Comparisons involving arithmetic or a function are left out, so a warning is always right, though some contradictions go unreported.

```python
errors, warnings = synalog.check('''V(x:) :- x in [1, 7, 12];
C(x:) :- V(x:), x > 10, x < 5;''')
# warnings: ['Contradictory conditions: x > 10, x < 5 can never all hold, so the rule gives no row: C(x:) :- V(x:), x > 10, x < 5']
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
