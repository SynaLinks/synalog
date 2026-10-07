# Test: distinct compares whole rows. (from tests/programs/dedup/04_distinct_on_two_columns.l)

V(x: 1, y: "a");
V(x: 1, y: "a");
V(x: 1, y: "b");
@OrderBy(D, "y");
D(x:, y:) distinct :- V(x:, y:);
