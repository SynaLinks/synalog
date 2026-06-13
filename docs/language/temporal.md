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

## `CurrentDate`

`CurrentDate` is a built-in concept with a single field `date:` holding today's date as `"YYYY-MM-DD"`. Use it for any "today"-relative logic. Do not create, update or delete it — the compiled SQL references a `CurrentDate(date)` relation that the runtime provides.

```logica
ThisMonthOrders(order_id:, created_at:) :-
  Orders(order_id:, created_at:),
  CurrentDate(date:),
  Substr(ToString(created_at), 1, 7) == Substr(date, 1, 7);
```

## Temporal edges

For relationships with validity periods, extract `start_date`/`end_date` through the pipeline when defining the edge, then filter with `CurrentDate`:

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
  CurrentDate(date:),
  start_date <= date, end_date >= date;
```

Two periods `[s1, e1]` and `[s2, e2]` **overlap** when `s1 <= e2 && s2 <= e1`.

## Complete example

Month grouping, a date-range filter, integer hour extraction over timestamped orders, and a `CurrentDate`-based "not yet expired" filter over subscriptions:

```logica
--8<-- "docs/examples/temporal.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/temporal.log"
    ```
