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

`Format` on Presto is lowered at compile time to a `\|\|` concatenation chain by
splitting the literal format string on `%s`; only `%s` placeholders over a
literal format string are supported (anything else is a compile error). Trino
keeps the native `FORMAT(...)`, which it does support.

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

## `Today` / `Now` built-in concepts (synalog-only)

`Today`/`Now` are synalog-only built-in concepts — upstream Logica has neither.
The **compiler inlines them per dialect** as a one-row relation over the
engine's native clock — no runtime table, so they work on every engine
including BigQuery and read-only catalogs:

| Concept            | inlined relation (DuckDB example)                         |
|--------------------|-----------------------------------------------------------|
| `Today(date:)`     | `(SELECT strftime(current_date, '%Y-%m-%d') AS date)`     |
| `Now(timestamp:)`  | `(SELECT current_timestamp AS timestamp)`                 |

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
- **Predicates named like library functions** (`Count`, `Range`, `Abs`,
  `Size`). Predicates and functions are separate namespaces in synalog: a
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

## Numbers with a decimal point

`1.5` is a float in Synalog, but a `DECIMAL` on Trino, Presto and
Databricks (Spark SQL), where decimal division rounds to the operands' scale:
`1.0 / 3.0` is `0.3` on Trino and Presto, `0.333333` on Spark, and an
assertion comparing it within 1e-9 fails. synalog writes such a literal in
exponent form there (`1.5E0`), which those engines read as a `DOUBLE`. Other
engines keep `1.5`: BigQuery reads it as a float, DuckDB divides decimals as
floats, and PostgreSQL's `numeric` keeps full precision. The goldens of
`28_list_membership`, `121_execution_float_sum` and
`157_execution_float_comparison` on those three engines are synalog's.

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

