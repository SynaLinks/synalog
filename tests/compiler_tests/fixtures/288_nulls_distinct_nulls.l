# Test: distinct keeps one null. (from tests/programs/nulls/07_distinct_nulls.l)

V(x: null);
V(x: null);
D(x:) distinct :- V(x:);
N(n? += 1) distinct :- D();
