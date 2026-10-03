# Test: Null never equals null in a join. (from tests/programs/execution/36_null_does_not_join.l)

A(k: 1, v: 1);
A(k: null, v: 2);
B(k: 1);
B(k: null);
J(v:) :- A(k:, v:), B(k:);
