# Test: With a group column, no rows means no group: no row at all. (from tests/programs/execution/61_grouped_aggregate_over_nothing.l)

V(k:, x:) :- k in ["a"], x in [1, 2];
Total(k:, t? += x) distinct :- V(k:, x:), x > 10;
