# Test: Min= ignores nulls. (from tests/programs/nulls/12_min_ignores_nulls.l)

V(x: null);
V(x: 4);
V(x: 9);
N(m? Min= x) distinct :- V(x:);
