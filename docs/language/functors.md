# Functors

Functors let you **parameterize predicates**: take an existing rule and substitute one of the predicates it depends on, producing a new predicate.

```logica
NewPredicate := FunctorPredicate(Arg1: Value1, Arg2: Value2);
```

## Reusing logic across segments

Define a generic pattern once, then instantiate it for different inputs:

```logica
# Define a reusable pattern
@OrderBy(SegmentRevenue, "segment_id");
SegmentRevenue(segment_id:, total? += amount) distinct :-
  Segment(segment_id:, user_id:),
  Orders(user_id:, amount:);

# Apply to different segments
EnterpriseRevenue := SegmentRevenue(Segment: EnterpriseCustomers);
SMBRevenue        := SegmentRevenue(Segment: SMBCustomers);
```

`SegmentRevenue` depends on a predicate named `Segment`; each functor application replaces `Segment` with a concrete predicate and yields a new, independent rule.

## The filter pattern

A common use is parameterized filtering: write a generic rule with a `Filter` dependency whose default matches all rows, then override the filter per query:

```logica
@OrderBy(CustomerRevenue, "customer_name");
CustomerRevenue(customer_name:, revenue? += amount) distinct :-
  Filter(customer_name:), Orders(customer_name:, amount:);

# Default filter = all rows
Filter(customer_name:) distinct :- Orders(customer_name:);

# Specialized: only John
JohnFilter(customer_name: "John");
JohnsRevenue := CustomerRevenue(Filter: JohnFilter);
```

This keeps the aggregation logic in one place while allowing any number of filtered variants — ideal for ephemeral, per-question queries layered on top of a stable rule base.

## Complete example

Both patterns together — the filter pattern (`JohnsRevenue`) and segment parameterization (`EnterpriseRevenue`, `SMBRevenue`):

```logica
--8<-- "docs/examples/functors.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/functors.log"
    ```
