# Test: A sum skips nulls. (from tests/programs/nulls/04_sum_ignores_nulls.l)

V(x: 1);
V(x: null);
V(x: 2);
N(t? += x) distinct :- V(x:);
