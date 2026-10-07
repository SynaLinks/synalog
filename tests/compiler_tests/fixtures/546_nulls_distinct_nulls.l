# Test: distinct keeps one null row. (from tests/programs/nulls/17_distinct_nulls.l)

V(x: null);
V(x: null);
D(x:) distinct :- V(x:);
N(n? += 1) distinct :- D(x:);
