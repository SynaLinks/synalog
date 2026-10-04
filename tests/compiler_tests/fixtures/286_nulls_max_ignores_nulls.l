# Test: Max skips nulls. (from tests/programs/nulls/05_max_ignores_nulls.l)

V(x: 1);
V(x: null);
V(x: 2);
N(m? Max= x) distinct :- V(x:);
