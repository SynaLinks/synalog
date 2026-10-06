# Intentional deviations from upstream Python Logica

Golden `.sql` files are normally generated from upstream Python Logica
(`generate_expected_sql.py`), and synalog's compiler is held to byte-parity
with them. For the cases below, upstream emits SQL that **cannot execute** on
the target engine, so synalog deviates and the golden files are generated
from synalog itself (verified by the e2e suite against live engines —
`tests/e2e`).

When re-running `generate_expected_sql.py`, do not overwrite the fixtures
listed here; regenerate their goldens with `synalog.compile` instead.

## Trino and Presto

Upstream emits BigQuery-style constructs that do not exist on Trino/Presto:

| Logica construct | upstream emits        | synalog emits (deviation)   |
|------------------|-----------------------|------------------------------|
| `Size(arr)`      | `ARRAY_LENGTH(arr)`   | `CARDINALITY(arr)`          |
| `Log(x)`         | `LOG(x)` (wrong arity on Trino, missing on Presto) | `LN(x)` |
| `++=` / ArrayConcatAgg | `ARRAY_CONCAT_AGG(x)` | `FLATTEN(ARRAY_AGG(x))` |
| `Element(arr, i)`| `arr[OFFSET(i)]`      | `ELEMENT_AT(arr, i + 1)`    |
| `x in arr`       | `x IN UNNEST(arr)`    | `CONTAINS(arr, x)`          |
| `ArrayConcat(a, b)` (Presto) | `ARRAY_CONCAT(a, b)` | `a \|\| b` (matches upstream's Trino mapping) |
| `Format(fmt, …)` (Presto) | `FORMAT(fmt, …)` | `seg \|\| arg \|\| seg …` (PrestoDB 0.293 registers no `FORMAT`/`printf`) |

`Format` on Presto, PostgreSQL and Trino is lowered at compile time to a `\|\|`
concatenation chain over its literal format string: PrestoDB has no printf,
PostgreSQL's `format` takes only `%s` (`%d` fails), and Trino's needs at least
one argument (`Format("100%%")` fails). Each placeholder is rendered in SQL:
`%s`, `%d` (as a `BIGINT`), `%.Nf` (a `DECIMAL(38, N)`, which keeps its zeros),
a width padded with zeros after the sign or with spaces (`-` aligns left, and
a longer value is not cut), and `%%`; any other placeholder is a compile
error. The goldens of the `Format` fixtures on those engines are synalog's.

Affected goldens (generated from synalog, not upstream):
`trino/{06_arrays,23_combine,48_split_function,50_array_functions,51_math_functions}.sql`
and the same five under `presto/`, plus `presto/56_format.sql`.

## Databricks

Upstream's `databricks` dialect inherits BigQuery-style constructs that do not
run on Spark SQL — and therefore not on Databricks, whose SQL surface is Spark
SQL plus extensions. synalog emits Spark/Databricks-valid SQL instead:

| Logica construct | upstream emits        | synalog emits (deviation)   |
|------------------|-----------------------|------------------------------|
| `Range(n)` / `RangeOf(a)` | `GENERATE_ARRAY(0, n - 1)` | `SEQUENCE(0, n - 1)` |
| `Size(arr)`      | `ARRAY_LENGTH(arr)`   | `SIZE(arr)`                 |
| `Length(s)` (string) | `ARRAY_SIZE(s)` (wrong — array fn) | `LENGTH(s)` (default) |
| `Element(arr, i)`| `arr[OFFSET(i)]`      | `ELEMENT_AT(arr, i + 1)`    |
| `Format(...)`    | `FORMAT(...)`         | `FORMAT_STRING(...)`        |
| `Split(s, sep)`  | `SPLIT(s, sep)` (`sep` a regular expression: `.` splits everywhere) | `SPLIT(s, REGEXP_REPLACE(sep, '([^a-zA-Z0-9])', '\\\\$1'))` |
| `ArrayConcat(a, b)` | `ARRAY_JOIN(a, b)` (wrong — stringifies) | `CONCAT(a, b)` |
| `++=` / ArrayConcatAgg | `ARRAY_CONCAT_AGG(x)` | `FLATTEN(COLLECT_LIST(x))` |
| `x in arr`       | `ARRAY_CONTAINS(x, arr)` (args reversed) | `ARRAY_CONTAINS(arr, x)` |
| `Like` / `ILike` / `Replace` | `x::string` cast | `CAST(x AS STRING)` (portable) |
| `List=`/`Array=`/`ArgMin`/`ArgMax`(K) | `ARRAY_AGG(x ORDER BY y)` | `SORT_ARRAY`/`ARRAY_SORT(COLLECT_LIST(STRUCT(...)))` |

Spark/Databricks `COLLECT_LIST` (`ARRAY_AGG`) does not accept an in-aggregate
`ORDER BY`, so ordered aggregates collect `STRUCT(value, arg)` pairs and sort
the resulting array. Verified by executing every fixture against an Apache Spark
Thrift Server (the open-source Databricks stand-in; see `tests/e2e`) and
comparing results to DuckDB. Affected goldens are generated from synalog, not
upstream (32 fixtures, listed in `generate_expected_sql.py:SYNALOG_GOLDENS`).

A field of a field (`r.pay.base`) fails in upstream's `databricks` dialect
(`Subscript() takes 3 positional arguments but 4 were given`): the goldens of
`rtypes_nested_number_field` and the nested `records2` fixtures are synalog's.

## `Today` / `Now` built-in concepts (synalog-only)

`Today`/`Now` are synalog-only built-in concepts — upstream Logica has neither.
The **compiler inlines them per dialect** as a one-row relation over the
engine's native clock — no runtime table, so they work on every engine
including BigQuery and read-only catalogs:

| Concept            | inlined relation (DuckDB example)                         |
|--------------------|-----------------------------------------------------------|
| `Today(date:)`     | `(SELECT strftime(current_timestamp AT TIME ZONE 'UTC', '%Y-%m-%d') AS date)` |
| `Now(timestamp:)`  | `(SELECT current_timestamp AT TIME ZONE 'UTC' AS timestamp)` |

Both read the clock in UTC on every engine: the session's time zone (local on
DuckDB and a Trino client, set per session on Databricks) would make the hour
and, near midnight, the date differ from engine to engine. On Trino, the text
of a timestamp is cast rather than formatted (`2026-10-05 15:19:59.910`, as
elsewhere, not ISO's `2026-10-05T15:19:59.910`).

`Now` is the most precise value; coarser parts (date, time, hour) are derived
via the `Substr`/`ToInt64` pipeline rather than exposed as extra fields. Both
names are reserved (the verifier rejects redefinition). The
`52_today_now` golden on every engine is generated from synalog, not upstream
(listed in `generate_expected_sql.py:SYNALOG_GOLDENS`).

## `SqlExpr` rejected in user programs (synalog-only verifier check)

Upstream Logica exposes `SqlExpr("...", {...})` as a general raw-SQL escape
hatch for user programs. synalog's verifier **rejects** it in user rules: raw
SQL is unparsed, untyped, unverified, and non-portable, defeating the
guarantees the verifier exists to provide. It remains available *internally* to
the dialect library (`ArgMin`/`ArgMax`/regex/...), which is injected during
compilation and never passes through the verifier. This is a verification-time
behavior, so it affects `synalog.check`, not the golden `.sql` files.

## DuckDB

`@Ground` materialization uses `DROP TABLE IF EXISTS x; CREATE TABLE x AS …`,
the same form as every other engine and as upstream Logica (DuckDB has no
special-casing — it previously emitted `CREATE OR REPLACE TABLE`, which matched
neither upstream nor the other engines; that override was removed).

`Log(x)` → `LN(x)`: Logica's `Log` is the natural logarithm (BigQuery's
single-arg `LOG` is a synonym of `LN`). DuckDB's native `LOG(x)` is base-10, so
upstream's bare `LOG` computes the wrong value there (verified: for x=2 it yields
0.301 = log₁₀2 instead of 0.693 = ln 2). synalog emits `LN(x)` so DuckDB matches
every other engine's natural-log result in the e2e cross-engine comparison.
Same deviation as Trino/Presto (psql too); bigquery/databricks keep native `LOG`
(already natural log) and sqlite relies on Logica's `LOG`=ln runtime UDF. The
`duckdb/51_math_functions.sql` golden is generated from synalog.

String literals use the standard `'…'` form (with `''` quote escaping), matching
upstream and every other engine. synalog previously emitted DuckDB's
non-standard `E'…'` escape-string prefix on *every* string literal, which
diverged from upstream and silently made all DuckDB goldens synalog-generated;
that override was removed.

**Recursion (`@Recursive`).** Upstream routes DuckDB to its *iterative flat*
recursion path (`GetFlatIterativeRecursionFunctor`), which materializes
`*_ifr*` iteration tables and relies on the **runtime re-executing** the
`@Iteration` block until a stop signal/fixpoint. synalog compiles to a single
static SQL script with no runtime loop, so the concertina can only expand
`@Iteration` a fixed `repetitions = (depth + 1 − ignition) / 2 + 1` times —
short of `depth` — which silently **truncates the transitive closure** (e.g. a
6-hop path is dropped: 20 rows instead of 21). synalog therefore uses the inline
`horizontal` unrolling that every other engine already uses
(`functors.rs`: `default_iterative = false`), which fully expands to `depth` at
compile time and is correct. The `duckdb/35_recursive_annotated.sql` golden is
generated from synalog (`generate_expected_sql.py:SYNALOG_GOLDENS`) and verified
end-to-end against live DuckDB, matching the other engines' results
(`tests/e2e`).

`Set=` sorts its values on DuckDB, `ARRAY_AGG(DISTINCT x ORDER BY x)`, so a set
compares equal however its rows were scanned; upstream leaves it unordered
(`231_arrays_set_aggregate_size`).

## PostgreSQL

Empty array literals: upstream annotates them with their inferred element type
(`ARRAY[]::text[]`); synalog's type inference is predicate-level only and does
not annotate individual expressions, so it emits `'{}'` instead — an
unknown-type literal that PostgreSQL coerces from context (CASE branches,
function arguments, comparisons), via `Dialect::empty_array_literal`. The
`psql/23_combine.sql` golden is generated from synalog accordingly and runs on
live psql (`tests/e2e`).

## Cosmetic: table aliasing for shared base tables (all engines)

Unlike the cases above, this is **not** an executability difference — upstream's
SQL is fine; synalog's is simply spelled differently. When one base table feeds
multiple `@Ground` predicates, upstream globally numbers that table's alias
(`t_0_Sales AS t_1_Sales`, `… AS t_2_Sales`) across the materialization scripts,
while synalog aliases each occurrence with the predicate name (`t_0_Sales AS
Sales`). Each occurrence is in its own statement, so there is no collision and
both forms are valid and produce identical results on every engine. The
`62_multi_ground_join.sql` goldens (all 7 engines) are generated from synalog and
verified end-to-end (`tests/e2e`), where every engine's rows match.

## Predicates named after SQL keywords

A predicate's name is the table alias of its rows in the generated SQL. Upstream
uses it as is, so a predicate named after an SQL keyword — `Values` in
`44_import_extend`, `Rows` in `48_split_function`, and as plausibly `Order`,
`Group` or `Select` — yields `FROM t_1_Values AS Values`, which no engine
parses. synalog never aliases a table with a keyword: it falls back to its
numbered alias (`t_1_Values AS t_2_Values`). The goldens of both fixtures are
generated from synalog on every engine; `tests/programs/execution` runs
predicates named `Order`, `Group`, `Select` and `Table` on DuckDB.

The same holds for the table of a grounded predicate: `@Ground(Order)` (or a
reused predicate grounded on Presto and Trino, `In`) writes
`logica_home.Order_table`, not `logica_home.Order`, which SQLite, Presto and
Trino do not parse.

## Fixtures from `tests/programs`

Fixtures numbered from 67 come from the self-checking programs of
`tests/programs` (each names its source on its first line), where they also run
on DuckDB and SQLite and their rows are checked. Their goldens are upstream's
except for the reasons below and the deviations above (keywords, deep
recursion, DuckDB recursion, Databricks, `x in arr` on Presto/Trino), all listed
in `generate_expected_sql.py:SYNALOG_GOLDENS`.

- **`@Limit(P, 0)`.** Upstream treats a limit of 0 as no limit and returns every
  row; synalog emits `LIMIT 0` (`81_directives_limit_zero`).
- **Front matter and `@Assert`.** Upstream has neither: it does not parse a file
  opening with front matter, and refuses `@Assert`. Neither changes the SQL of
  the predicate, which synalog's golden holds.
- **A keyword inside an underscored name** (`Count_distinct_items`,
  `Foo_distinct_ends`): upstream splits the rule at `distinct`; synalog reads
  `distinct` as a keyword only as a whole word.
- **Functions named like library functions.** A function the program defines
  (`Size(x) = ...`) is the one a value calls: upstream compiled `Size(x)` to
  the built-in, ignoring the definition. A relation of that name leaves the
  built-in as is (below).
- **Predicates named like library functions** (`Count`, `Range`, `Abs`,
  `Size`, `Sum`). Predicates and functions are separate namespaces in synalog: a
  predicate `Abs` is a relation, `Abs(x)` in a value is still `ABS`
  (`execution_predicate_named_like_a_function`). On DuckDB and PostgreSQL,
  whose SQL upstream types, upstream's type inference conflates them and fails
  (`KeyError: 'expression'`, or "inconsistent rules" against its own `Abs`).

## Which predicate a fixture tests

A fixture tests the predicate of the last rule it writes. The harnesses
(`tests/common/mod.rs`, `tests/e2e/conftest.py`, `generate_expected_sql.py`)
used to take the last rule of the parsed program and to skip names shaped
like an import (`Module_Pred`). The parser appends rules of its own — a
predicate with several aggregating rules becomes `P_MultBodyAggAux` and a `P`
rule at the end — so `17_outer_join`, `28_multi_rule_predicate`,
`35_recursive_annotated` (and psql's `14_recursion`) tested that aggregate
instead of `Test`; and a predicate the program names `Assert_P_name` or
`Foo_Bar` could never be tested, nor a functor's result (`F := G(...)`). The
harnesses now take the rule written last in the source (by the position of
each rule's verbatim text) and count `F := G(...)` as defining `F`. The goldens
of those fixtures now hold `Test`. Where synalog deviates from upstream on
them, the golden is synalog's, for a reason documented here: `17_outer_join`
concatenates arrays (`ARRAY_CONCAT_AGG` exists only on BigQuery, see above;
psql writes empty arrays `'{}'`, see PostgreSQL).

`32_nested_records` (Presto, Trino, psql) and psql's `51_math_functions` were
synalog goldens without being listed as such, so regenerating from upstream
replaced them: upstream writes `STRUCT(...)`, which Presto and Trino do not
have (synalog casts `ROW(...)`), and psql's `LOG` is base 10 where Logica's
`Log` is natural (synalog emits `LN`). They are listed now.

## Columns named after SQL keywords

Upstream writes column names as they are: a column `order` yields
`1 AS order` and `R.order`, which SQLite, PostgreSQL and BigQuery refuse (a
table with an `order` or `group` column is common). synalog quotes a column
that is a keyword or not a plain identifier, in the dialect's quotes
(backticks on BigQuery and Databricks, where double quotes make a string),
also in `ORDER BY` and in `search()`. `64_keyword_columns` is generated from
synalog on every engine.

A column `at` is quoted too: DuckDB reads `ORDER BY at desc` as the start of
`AT TIME ZONE` and refuses it (the `dates2`, `joins2`, `order2` and
`distinct2` fixtures, whose events have a time `at`).

## `Count=` is exact

Upstream compiles `Count=` (the number of distinct values) to BigQuery's
`APPROX_COUNT_DISTINCT` on every engine but SQLite, PostgreSQL and DuckDB:
Trino and Presto have no such function (their query fails), and BigQuery and
Databricks return an estimate. synalog compiles it to `COUNT(DISTINCT x)` on
every engine, so a count is the same wherever it runs
(`112_execution_list_aggregate`, `131_execution_count_distinct_value`).

## Types on PostgreSQL

- A null in a column whose type inference knows is cast to it
  (`CAST(null AS numeric)`): PostgreSQL types `null UNION ALL null` as text,
  and the next rule's number then fails ("UNION types text and integer
  cannot be matched").
- A `combine` whose operand type is not known is not cast. Upstream casts it
  to `numeric`, and `combine Min= s` over strings failed
  (`CAST('ant' AS numeric)`).
- The type of a column no longer depends on hash order: its vertices are
  merged, the most specific type kept (a rule giving it a null made it
  unknown, at random).

## `ArgMin=` / `ArgMax=` on PostgreSQL

Upstream wraps the value in a one-field composite type, declared from the
library's generic definition, where its type is unknown: the field is `text`,
and `ArgMax= id -> score` returns the id as text. synalog aggregates the value
itself, `(ARRAY_AGG(id ORDER BY score DESC NULLS LAST))[1]`, which keeps its
type; `NULLS LAST`, since PostgreSQL sorts nulls first in descending order, so
a row without a score is never the maximum. The PostgreSQL variant of
`09_argmin_argmax`, simplified to avoid them, is removed.

## Numbers with a decimal point

`1.5` is a float in Synalog, but a `DECIMAL` on Trino, Presto, Databricks
(Spark SQL) and DuckDB, and a `numeric` on PostgreSQL. Decimal division rounds
to the operands' scale (`1.0 / 3.0` is `0.3` on Trino and Presto, `0.333333`
on Spark), DuckDB's decimal products overflow (`DECIMAL(18)`), and decimal
sums are exact where doubles are not (`0.1 + 0.2 == 0.3` held on DuckDB and
PostgreSQL only). synalog writes such a literal as a double: in exponent form
(`1.5E0`) on Trino, Presto, Databricks and DuckDB, `CAST(1.5 AS double
precision)` on PostgreSQL. SQLite and BigQuery read `1.5` as a float. The goldens of
`28_list_membership`, `121_execution_float_sum` and
`157_execution_float_comparison` on those three engines are synalog's.

## `ToInt64` rounds

`ToInt64(2.9)` is 3 on BigQuery, PostgreSQL, DuckDB, Trino and Presto, whose
casts round, but 2 with upstream's `CAST(x AS INTEGER)` on SQLite and
`CAST(x AS BIGINT)` on Databricks, which truncate. synalog rounds a float
first on those two (`ROUND`, applied on SQLite only to a `real` value, so a
text such as `'42'` still converts), so the result is the same everywhere. The
goldens of `61_date_arithmetic` and `122_execution_to_string_and_back` on
SQLite and Databricks are synalog's.

A half is a further difference: DuckDB's and PostgreSQL's casts of a double,
and PostgreSQL's `round` of a double, round it to even (`ToInt64(5 / 2)` and
`Round(5 / 2)` are 2), the other engines away from zero (3). synalog rounds
with DuckDB's `ROUND` and PostgreSQL's numeric `round` before the cast, so a
half goes away from zero everywhere (`tests/programs/rounding`); PostgreSQL's
`Round(x, digits)`, which exists only for a numeric, casts `x` to numeric.
Text and whole numbers written out convert with a plain cast. The goldens of
the fixtures with `ToInt64` or `Round` on DuckDB and PostgreSQL are synalog's.

## Record fields named after SQL keywords

Like columns, a record field that is a keyword or not a plain identifier
(`{inner: 1}`, `r.inner`) is quoted in the dialect's quotes, in record
literals, row types and subscripts; upstream writes it as is, which the
engines refuse. SQLite records are JSON objects, whose keys need no quoting.

## `StringAgg=`

Upstream writes `GROUP_CONCAT(x)` on SQLite and DuckDB, and `STRING_AGG(x)`
elsewhere: PostgreSQL's needs a delimiter, BigQuery's a string, and Trino,
Presto and Spark have none. synalog follows SQLite everywhere, the values as
text joined with `,`, null when they all are: `STRING_AGG(CAST(x AS TEXT), ',')`
on PostgreSQL and BigQuery, `ARRAY_JOIN` of the collected values on Trino,
Presto and Databricks (`226_aggregation_string_agg_single`).

## Trivially true comparisons

A rule matching a constant against the same constant (`P(city: "paris")` and
`C(city: "paris", ...)` joined on `city`) leaves `'paris' = 'paris'`, which
upstream drops, except on DuckDB and PostgreSQL: there its type inference
annotates the two sides differently and they no longer compare equal. synalog
drops it everywhere (`258_joins_three_way`,
`277_negation_negation_with_a_constant`). Cosmetic only.

## Deep recursion

Past 20 steps, upstream compiles `@Recursive` into tables: a few steps, then an
`@Iteration` recomputing two of them from each other, which its runner loops
over. A SQL script runs each statement once, so upstream's script stops after
a few steps (`@Recursive(P, 40)` reached 4) and, with mutual recursion, reads
tables before they are computed.

synalog plans the run instead (`synalog.plan`): each table after the tables it
reads, a loop per recursion, and what reads its result after the loop.
`synalog.execute` stops each loop as soon as it converges; `compile` writes
the loop out, up to the declared depth. A recursion of one `distinct`
predicate, without aggregation, whose rules reference it at most once, is
evaluated semi-naively: each step derives only the rows new at the previous
step (`P_sn_delta`), adds them to the rows so far (`P_sn_full`, an `INSERT`),
and the recursion has converged when a step adds nothing. Other recursions
(mutual recursion, aggregation in the recursion) recompute every step. The
deep-recursion fixtures (`65_deep_recursion`, `66_deep_mutual_recursion`,
`148_` to `199_`) are generated from synalog on every engine.

## Division is exact

`/` is BigQuery's, which divides exactly (`7 / 2` is 3.5), as DuckDB and Spark
do; SQLite, PostgreSQL, Trino and Presto divide integers to an integer (3), so
upstream's `/` depended on the engine. synalog makes the dividend a float on
those four (`CAST(a AS REAL) / (b)` on SQLite, `double precision` on
PostgreSQL, `DOUBLE` on Trino and Presto), and every engine returns 3.5.

## A minus after an operator

Upstream cannot parse a minus right after an operator (`2 * -3`, `7 % -3`,
`2 ^ -1`, `2 - -3`, though `2 + -3` parses): it splits the expression at its
last minus, leaving `2 *`. synalog does not split at a minus that follows an
operator, which negates its operand.

## Functions as conditions

A function written as a condition (`E(x:) :- V(x:), IsEven(x)`) holds for every
`x`, as a function has a row for each argument, whatever its value; upstream
returns every row. The verifier refuses it, pointing to `IsEven(x) == true`.

## Ordering and limit of a recursion

Upstream moves a recursive predicate's directives onto each step of the
recursion, so `@Limit(P, 2)` cut every step to 2 rows: the next step started
from those (a closure with `"x desc"` and limit 2 over 1 → 5 returned 5 and 1),
and a recursion until convergence could oscillate forever. synalog applies
`@OrderBy` and `@Limit` to the result only; the semi-naive result also kept
no ordering at all. The goldens of the recursive fixtures with an ordering are
synalog's.

## Pages and searches keep the order

`compile(limit=, offset=)` and `search()` wrap the predicate's query in a
subquery, whose `ORDER BY` need not survive it: Trino and Presto drop it, and
returned a page of unordered rows. The outer query orders again by the
predicate's `@OrderBy`. Trino and Presto also take `OFFSET` before `LIMIT`
(`LIMIT 2 OFFSET 1` does not parse there).

## Nulls sort last

Engines order nulls differently: last ascending on PostgreSQL, Trino, Presto
and DuckDB, first on SQLite, Spark and BigQuery; first descending on
PostgreSQL only. synalog sorts nulls last in both directions, adding
`NULLS LAST` where the engine would not, unless the ordering says where nulls
go (`"x nulls first"`).

## Engine functions

- Facts on Databricks, a predicate whose rules are all constant rows, are
  the rows of one `VALUES` rather than a `UNION ALL` of constant `SELECT`s:
  Spark (3.5 and 4.0) fails to plan a correlated subquery over such a union
  ("NoSuchElementException: key not found"), as in a `combine` per row.
- `Split("", ",")` is one empty part on every engine: PostgreSQL's
  `STRING_TO_ARRAY` gives an empty array for the empty string.
- `Size` of a null list is null: `CARDINALITY` on PostgreSQL (upstream's
  `COALESCE(ARRAY_LENGTH(x, 1), 0)` made it 0) and `ARRAY_SIZE` on Databricks
  (Spark's `SIZE(null)` is -1). On SQLite, Synalog's sessions register a
  `Split` that maps a null to null (Logica's fails on it).
- Unnesting on Databricks is a `LATERAL (SELECT explode(x) AS v)` subquery:
  Spark does not resolve a column of an earlier table inside a table function
  of the `FROM` list (`explode(L.l)`), so membership in a list column failed.
- `ToString` of a boolean is `"true"` or `"false"` on SQLite too, which stores
  booleans as 1 and 0: an argument that is a boolean by its form (a literal,
  a comparison, a connective, a membership, a null test) is written
  `CASE x WHEN 1 THEN 'true' WHEN 0 THEN 'false' END`.
- `Join` is `ARRAY_JOIN` on Trino, Presto and Databricks, which have no
  `ARRAY_TO_STRING`.
- `ToString` of a `DOUBLE` on Trino is scientific with `CAST` (`1.5E0`);
  synalog formats it (`format('%s', x)`, which writes a null as `'null'`, so
  only non-null values are formatted).
- `Range(n)` with `n` 0 or less is empty: `SEQUENCE(0, -1)` counts down on
  Trino, Presto and Spark (synalog filters `SEQUENCE(0, n)` below `n`), and
  `ARRAY_AGG` of no rows is null on PostgreSQL.
- `Size` of a list written out is its length, and `ArrayConcat` with an empty
  list written out is the other list: PostgreSQL, Trino and Presto cannot type
  a lone empty array.
- `ToInt64` on SQLite names its argument once, in a one-row subquery: written
  three times, nested conversions grow exponentially, and SQLite's parser
  overflowed (`61_date_arithmetic`). An argument that is text by its form
  (`Substr`, `ToString`, `++`, a string literal, ...) has no fraction to
  round and is a plain `CAST(x AS INTEGER)`: SQLite before 3.46 has a fixed
  parser stack, which the subquery's nesting still overflowed in deep date
  arithmetic (SQLite 3.37, Ubuntu 22.04).

## Inlining and correlation

A predicate of one rule is inlined where it is read. In a negation's subquery,
an inlined predicate whose body holds a negation of its own put that negation
two levels below the table it reads, which Trino, Presto and Spark cannot
correlate ("Given correlated subquery is not supported"). Such a predicate is
a table (a `WITH`) instead.

A table alias is the predicate's name, and Trino and Presto read names without
case: inside a subquery, `K.k` read `K` as the column `k` of the subquery's own
table ("Expression K is not of type ROW"). An alias that equals a column name
of the program, ignoring case, is numbered instead (`t_0_K`).

## Reused predicates on Presto and Trino

Presto and Trino inline a `WITH` everywhere it is read. A knowledge graph's
edges join through its nodes, so a two-hop neighborhood read `Link` three
times, each `Link` read `Related` twice, each `Related` read `Person` twice:
some 24 copies of `Person`, each an aggregation stage, past Presto's 100
stages (QUERY_HAS_TOO_MANY_STAGES). On those engines, a derived predicate
(whose rules read other predicates) read more than once is materialized, as
`@Ground` does, into Synalog's schema; the run drops the tables once its rows
are read. The goldens of the fixtures with such predicates on Presto and Trino
are synalog's.

## Recursion on Presto, Databricks and Trino

Presto plans an unrolled recursion in time exponential in its steps: depth 10
took minutes for a mutual recursion, depth 20 exceeded its 3-minute planning
timeout. Each step is an aggregation over a union of the previous step's
rows, and Presto's distributed planning revisits the whole chain below it at
each level (with `single_node_execution_enabled` it plans in milliseconds; a
`FULL JOIN` instead of the union also does, but does not express rules with
several bodies). Spark (Databricks) has the same trouble: its optimizer took 6 seconds for an
assertion over a recursion of depth 10 and minutes for depth 12. synalog
computes every recursion into tables on Presto and Databricks, as past 20
steps elsewhere, so each step is one short query. Trino plans unrolled steps
well, but inlines every CTE where it is read: an assertion reading a recursion
three times copied it three times, past Trino's 150 stages
(QUERY_HAS_TOO_MANY_STAGES), so Trino computes recursions into tables too. A depth shorter than
the iteration's first steps is written out step by step, each in its own
table. The goldens of the recursive fixtures on Presto are synalog's.

A functor applied to such a recursion (`R := Reach(Edge: Route)`) copies its
loop too: the iteration's predicates, read by no rule of the recursion but by
its loop, are renamed with the rest, or the copy ran the original's loop over
the original's edges (`functors2_reach_from_*`).

## What a step of recursion is

A step applies every rule of the recursion once. Upstream unrolls mutual
recursion up to 20 steps vertically, the other predicates inlined into each
step of the first, so a step applies the whole cycle (`@Recursive(Even, 5)`
over `Even` and `Odd` reached 10), while its iterated recursion past 20 steps
applies each rule once (depth 22 reached 22). synalog unrolls mutual
recursion horizontally at every depth (`139_execution_mutual_recursion`).
The iterated recursion starts with a few steps (4 to 6) before it loops, so
it computes more steps than a shorter depth asks; synalog writes such a depth
out step by step, which matters to a recursion that does not only grow
(`210_verifier_recursion_through_aggregate`, whose value cycles).

`@Recursive` takes the predicate and its depth only (upstream also takes
`iterative`, `ignition`, `stop` and `satellites`, which synalog ignored
silently; the verifier now refuses them), and its default depth is 8 on every
engine (upstream: 32 on DuckDB).

## Functors applied to imported predicates

`63_functor_imported` applies a functor to a predicate imported from another
module: `EnterpriseRevenue := SegmentRevenue(Segment: Enterprise)`, with
`SegmentRevenue` and `Segment` defined in `lib/segments.l`. Importing prefixes
every predicate of the module (`Segments_Segment`), but the argument keeps
its plain name, so upstream finds no `Segment` to replace: it only warns,
and the functor returns the generic rule's rows — the revenue of every
customer (107) instead of the enterprise one (100). synalog resolves an
argument to the predicate of that name in the applied predicate's module,
and an argument that still names nothing it depends on is an error. The
goldens are generated from synalog on every engine.

## The types of a record's fields

Presto and Trino build a record as `CAST(ROW(...) AS ROW(field type, ...))`,
PostgreSQL as `ROW(...)::type` of a declared composite type: both need each
field's type. A field has the type of its value: a literal's, a column's (as
type inference gives it), a list's element, a number for arithmetic, text for
string functions, a boolean for a comparison. Synalog used to type every field
that was not a literal as text, so `{n: x}` with `x` a number came back as
`'9'`, and sorted after `'10'` (`tests/programs/rtypes`). Upstream writes
`(SELECT x AS n)` on Presto and Trino, which is not a record.

## Records compared field by field

`{a: x} == {a: x * x}` compares the fields, `x = x * x`; upstream compares the
two records whole (`JSON_OBJECT(...) = JSON_OBJECT(...)` on SQLite). The same
rows (`selfref_records_of_themselves`).

## Escapes in single-quoted strings

A single-quoted string takes backslash escapes (`'it\'s'`, `'a\tb'`),
which upstream does not parse. The goldens of the `quotes` fixtures, which
hold such strings, are synalog's.

## Comparisons in a value after `=`

A head's value follows its first `=`: `F(x) = if x >= 4 then 1 else 2`,
`n? += if x != 0 then 1 else 0`. Upstream splits the head at every `=`, the
`=` of `>=`, `<=`, `==` and `!=` too, and refuses such a value ("Too many '='
in predicate value"). The goldens of the fixtures with one are synalog's.

## Table numbers after `Array=`

Compiling `Array= x -> y` spends one table number more than upstream, so the
tables after it are numbered one higher (`t_3_Sale` for upstream's
`t_2_Sale`). Cosmetic (`agg3_ids_by_qty_in_*`).

## A combine as a function's argument

`Coalesce((combine += 1 :- U(a: n)), 0)`: upstream strips the parentheses of
the argument and reads the colon of `:-` as a field's, refusing it
("Positional argument can not go after non-positional arguments"), or
misreads it in second position. synalog takes a colon as a field's only after
a field name. The goldens of the fixtures with one are synalog's.

## A backslash escapes in `Like`

`Like("a_c", "a\_c")`: PostgreSQL and Spark read a backslash in a pattern as
an escape by default, DuckDB, SQLite, Trino and Presto do not, so the same
program matched on some engines only. synalog writes `ESCAPE '\'` (`'\\'`
on Databricks, whose literals take escapes; BigQuery's LIKE escapes with a
backslash already). The goldens of the fixtures with `Like` are synalog's.

## String literals that no statement splitter misreads

A program's text reaches SQL as literals and checked names only
(docs/verification.md, "Text never becomes SQL"; `tests/programs/injection`).

- Databricks and BigQuery literals take backslash escapes: a quote of the
  value is written `\u0022`, not `\"`, so a literal holds no quote but its own
  two, and a script split at semicolons outside quotes never cuts one
  (`"\"; DROP TABLE t; --"` would end at `\"` for a splitter that does not
  know these escapes).
- PostgreSQL: a string with a backslash is `E'...'`, read the same whatever
  `standard_conforming_strings` says.
- `search()` writes its pattern as such a literal; upstream doubled quotes only.
- `@Dataset` takes a schema name; a table named in `@Ground` lives in Synalog's
  dataset.
- A table the program reads is a name: upstream wrote `` `(SELECT ...)` `` into
  the SQL as such, and any backquoted name verbatim. A backquoted path is
  quoted part by part (whole on BigQuery).
- `${flag}` is not substituted into the SQL text (upstream did, inside string
  literals too); `FlagValue("flag")` gives a flag as a string literal.
- A program reaches no file, process or service: the library's `ReadFile`,
  `ReadJson`, `WriteFile`, `PrintToConsole`, `Intelligence` and Clingo
  functions are gone, and `@AttachDatabase` and `@Ground(..., copy_to_file:)`
  are refused.
- Databricks quotes an identifier's backtick by doubling it (upstream wrote
  `` \` ``, which Spark does not read); BigQuery escapes a backslash in one.

The goldens of the fixtures with such strings are synalog's.

## A number's text

Engines write a number as text each their own way: `0.30000000000000004` or
`0.3`, `1e+20`, `1.0E20` or `100000000000000000000`, `5.0` or `5`. synalog's
`ToString` of a number gives one text everywhere: a whole number without a
decimal point, every digit below 10^18; any other number with at most 15
significant digits (what a double holds reliably), in plain decimal, trailing
zeros trimmed, at most 15 decimals; the engine's own form from 10^38. Large
numbers round in DECIMAL, or from the exponent form where an engine rounds
only to a constant number of digits (DuckDB, Spark, SQLite)
(`tests/programs/numtext`). The goldens of the fixtures with `ToString` of a
number are synalog's.

## Portable functions

`StartsWith`, `EndsWith`, `Strpos`, `Lpad`, `Rpad`, `Repeat`, `Ifnull`,
`RegexpContains`, `RegexpReplace`, `RegexpExtract`, `Trunc` and `Div` are
written so they run, and agree, on every engine: upstream passed most of them
through as a function of the same name, which only some engines have. `If` is
`CASE WHEN` (SQLite and PostgreSQL have no `IF()`). `RegexpContains` of a null
is null on SQLite too, where `REGEXP` gives false. A null typed by its column
is cast to the column's type (`CAST(null AS text)`), so PostgreSQL knows it.
The goldens of the `funcs` fixtures are synalog's.

## Lists without a type of their own

An empty list (`[]`) and a null have no element type, which PostgreSQL needs
(`CARDINALITY('{}')`, `UNNEST('{}')`, `ARRAY_TO_STRING('{}', ',')` do not
resolve) and Trino, Presto and Databricks need where they meet a typed list
(a `UNION` of `ROW(xs array(double))` and `ROW(xs array(varchar))`,
`ELEMENT_AT(null, 1)`). synalog types them from where they are written: the
column's type (the other rules of its predicate), the field of the record they
are in, the other list of an `ArrayConcat`, text for `Join`, the value an
unnested element equals: `CAST('{}' AS numeric[])`, `CAST(null AS ARRAY<STRING>)`.

A column's type is the intersection of the types its rules give it, the same in
any order: before, a record whose list field was `[]` in one fact and
`["x"]` in another could be typed either way from one run to the next.

## `Join` on SQLite

`Join` is SQL on SQLite (`GROUP_CONCAT` over `JSON_EACH`): upstream's Python
function wrote a null element as `None` and a number as Python prints it. A
null is skipped, as on the other engines, and an empty list joins to `''`.

## A dollar on Databricks

Spark substitutes `${var}` in a statement's text before parsing it, inside
string literals too: `"costs ${amount}"` came back as `"costs "`, and
`"${env:HOME}"` as the driver's home directory. A dollar in a Databricks
string literal is `\u0024`; a field or predicate name holds no `$`.

## Rounding to digits

`Round(x, 2)` of `1.005` was 1.01 on DuckDB, PostgreSQL and Databricks (a
decimal literal) but 1.0 on SQLite, Trino and Presto (the double nearest
1.005 is below it), and `2.675` gave 2.67 on SQLite only. synalog rounds the
number as its text shows it, at 15 significant digits, half away from zero,
as a spreadsheet does, with the same SQL on every engine (the half unit of
the 15th significant digit added before the floor); the result is a double.

## Division by zero, remainders

A division by zero was an infinity on DuckDB and Trino, a NaN for `0 / 0`,
the text `Infinity` from Presto, an error on PostgreSQL, and null on SQLite
and Spark; `Div` and `%` by zero failed on several. It has no value (null) on
every engine: the divisor is `NULLIF(y, 0)`. SQLite's `%` truncated both sides
to integers (`7.5 % 2` was 1): it is the remainder of the quotient truncated
toward zero there. PostgreSQL has no `MOD` of doubles: it takes numerics.

## A null meets no null

Two facts with a null key, `A(k: null)` and `B(k: null)`, joined on `k`: the
facts are inlined and both sides become the literal `null`, and the
unification `null == null`, two identical expressions, was dropped as
trivially true, so the join had a row. A null equals nothing in SQL: an
equality holding a null stays (`WHERE null = null`, no row). A variable
unified with itself (`x == x`) still holds.

## Types across predicates

Type inference gave each edge of its graph its own copy of a vertex's type,
and never linked a predicate's columns to their uses elsewhere (the link was
a placeholder): a column of `Q(x:) :- V(x:)` stayed of no type though `V`'s
was a number, a record field's type was updated on a copy and lost, and the
type of a column given by several facts depended on hash order. A vertex now
has one type, shared by every edge it is in: a relation's column wherever it
is read, a variable within its rule (`x` of one rule is not `x` of another),
a field of either. A literal, and a function's or built-in's argument, is a
vertex per use. Annotations (`@Make`) are left out.

## A search reads the text ToString gives

`search` matched a pattern against each column cast to text by the engine:
`10.0` read `10.0` on some engines and `10` on others, a boolean `1` on
SQLite. A number is read as `ToString` writes it, the same on every engine,
a boolean as `true` or `false`.

## A recursion's accumulated table

A step of a recursion can give a column a wider type than its first rows (an
integer that becomes a bigint, then a sum of it): PrestoDB refuses to insert
a bigint into an integer column, and PostgreSQL and DuckDB fail once a value
no longer fits it. A column widens at most twice (integer, bigint, double),
so the types stop changing within twice as many steps as there are columns:
the accumulated table is created from the base rows and that many steps
applied to empty tables, of the widest types from the start, and every
step's new rows are inserted, in linear time, on every engine.

## A value computed once

A variable is replaced by its value wherever it is used, so a rule defining
each variable from the one before (`b == a + a, c == b + b, ...`) wrote its
first value 2^n times: a ten-line date function compiled to 2 MB of SQL. A
large value (more than 60 nodes) of a variable used more than once is
computed once, as the one element of a list unnested beside the rule's
tables, and the variable is that element.

## `Div` of large numbers

`Div(a, b)` told the sign of the quotient by `a * b < 0`, a product that
overflows 32-bit integers (`Div(719468, 146097)` failed on DuckDB) though the
quotient is small. It compares the signs instead: `(a < 0) <> (b < 0)`.
