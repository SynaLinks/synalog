# Temporal data

Synalog has one rule for `TIMESTAMP`, `DATE`, `DATETIME` and `TIME` columns: **never apply arithmetic or comparison directly to a temporal column**. Engines disagree wildly on temporal semantics; the portable pipeline is string-based.

## The pipeline

1. `ToString(x)` — convert the temporal value to its ISO string form.
2. `Substr(s, i, l)` — extract the part you need (**1-based** indexing).
3. `ToInt64(x)` — only if you need arithmetic on the part.

```logica
# Year-month for grouping
month == Substr(ToString(created_at), 1, 7);    # "2024-01"

# Date only
date == Substr(ToString(created_at), 1, 10);    # "2024-01-15"

# Hour as int
hour == ToInt64(Substr(ToString(timestamp), 12, 2));

# Year/month/day as ints
year  == ToInt64(Substr(date_str, 1, 4));
month == ToInt64(Substr(date_str, 6, 2));
day   == ToInt64(Substr(date_str, 9, 2));
```

## Date ranges

ISO-format strings compare correctly as strings, so range filters are simple:

```logica
RecentOrders(order_id:) :-
  Orders(order_id:, created_at:),
  ToString(created_at) >= "2024-01-01",
  ToString(created_at) < "2024-02-01";
```

## Grouping by month

```logica
@OrderBy(MonthlyOrders, "month");
MonthlyOrders(month:, count? += 1) distinct :-
  Orders(created_at:),
  month == Substr(ToString(created_at), 1, 7);
```

## `Today` and `Now`

Two built-in concepts read the engine's clock:

- `Today(date:)` — today's date as a `"YYYY-MM-DD"` string.
- `Now(timestamp:)` — the current instant as the dialect's native timestamp.

`Now` is deliberately the **most precise** value the engine offers; every coarser part — date, time of day, hour, minute — is *derived* from it through the [pipeline](#the-pipeline) (`ToString` → `Substr`), so there is no separate `time:` or `date:` field to keep in sync.

Use them for any "today"- or "now"-relative logic. Do not create, update or delete them — the compiler inlines a one-row relation per dialect (using each engine's native current-date/timestamp SQL), so they need no runtime table and work on every engine, including BigQuery and read-only remote catalogs.

```logica
ThisMonthOrders(order_id:, created_at:) :-
  Orders(order_id:, created_at:),
  Today(date:),
  Substr(ToString(created_at), 1, 7) == Substr(date, 1, 7);
```

### Deriving parts of `Now`

The time of day, hour, and date all come out of the same `Substr` pipeline you use for any temporal column:

```logica
NowParts(date:, time:, hour:) :-
  Now(timestamp:),
  date == Substr(ToString(timestamp), 1, 10),    # "2026-06-13"
  time == Substr(ToString(timestamp), 12, 8),    # "14:53:09"
  hour == ToInt64(Substr(ToString(timestamp), 12, 2));
```

Within one statement the engine reads `Today` and `Now` from the same clock, so the date prefix of `Now`'s timestamp equals `Today`'s date.

### Relative dates and times

"Yesterday" and "ten minutes ago" need date/timestamp **arithmetic**. Do it the same portable way as everything else: pull the parts out with `Substr`, turn them into integers with `ToInt64`, do the math, and reassemble with `ToString`. **Never reach for `SqlExpr`** to subtract an interval — raw SQL is unsafe and non-portable, and the [verifier rejects it](../verification.md). Integer division is also not portable, so use `%` (exact) and conditionals instead.

Two small helpers — month length (with the leap-year rule) and two-digit zero-padding:

```logica
DaysInMonth(y, m) = n :-
  leap == (if (y % 4 == 0) && ((y % 100 != 0) || (y % 400 == 0)) then 1 else 0),
  n == (if m == 2 then 28 + leap
        else if (m == 4) || (m == 6) || (m == 9) || (m == 11) then 30
        else 31);

Pad2(x) = (if x < 10 then "0" ++ ToString(x) else ToString(x));
```

`Yesterday` subtracts one day, borrowing into the previous month/year at a boundary:

```logica
Yesterday(date) = ToString(py) ++ "-" ++ Pad2(pm) ++ "-" ++ Pad2(pd) :-
  y == ToInt64(Substr(date, 1, 4)),
  m == ToInt64(Substr(date, 6, 2)),
  d == ToInt64(Substr(date, 9, 2)),
  py == (if d > 1 then y else if m == 1 then y - 1 else y),
  pm == (if d > 1 then m else if m == 1 then 12 else m - 1),
  pd == (if d > 1 then d - 1 else DaysInMonth(py, pm));
```

`TenMinutesAgo` subtracts ten minutes, borrowing into the hour and (at midnight) reusing `Yesterday` for the date. Ten minutes crosses at most one hour, and one hour-borrow crosses at most one day, so no division is needed:

```logica
TenMinutesAgo(ts) = ndate ++ " " ++ Pad2(nhh) ++ ":" ++ Pad2(nmm) ++ ":" ++ ss :-
  date == Substr(ts, 1, 10),
  hh == ToInt64(Substr(ts, 12, 2)),
  mm == ToInt64(Substr(ts, 15, 2)),
  ss == Substr(ts, 18, 2),
  nmm  == (if mm >= 10 then mm - 10 else mm + 50),
  hh1  == (if mm >= 10 then hh else hh - 1),     # borrow an hour when mm < 10
  nhh  == (if hh1 < 0 then 23 else hh1),
  ndate == (if hh1 < 0 then Yesterday(date) else date);
```

Apply them to `Today`/`Now` and filter with plain string comparison:

```logica
RecentlyCreated(order_id:) :-
  Orders(order_id:, created_at:),
  Now(timestamp:),
  cutoff == TenMinutesAgo(ToString(timestamp)),
  ToString(created_at) >= cutoff;
```

## Temporal edges

For relationships with validity periods, extract `start_date`/`end_date` through the pipeline when defining the edge, then filter with `Today`:

```logica
@OrderBy(MemberOfEdge, "employee_id");
MemberOfEdge(employee_id:, team_id:, start_date:, end_date:) distinct :-
  EmployeeNode(employee_id:), TeamNode(team_id:),
  TeamAssignments(employee_id:, team_id:, started_at:, ended_at:),
  start_date == Substr(ToString(started_at), 1, 10),
  end_date   == Substr(ToString(ended_at), 1, 10);

@OrderBy(CurrentMember, "employee");
CurrentMember(employee:, team:) :-
  MemberOfEdge(employee_id:, team_id:, start_date:, end_date:),
  EmployeeNode(employee_id:, name: employee),
  TeamNode(team_id:, name: team),
  Today(date:),
  start_date <= date, end_date >= date;
```

Two periods `[s1, e1]` and `[s2, e2]` **overlap** when `s1 <= e2 && s2 <= e1`.

## Complete example

Month grouping, a date-range filter, integer hour extraction over timestamped orders, and a `Today`-based "not yet expired" filter over subscriptions:

```logica
--8<-- "docs/examples/temporal.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/temporal.log"
    ```
