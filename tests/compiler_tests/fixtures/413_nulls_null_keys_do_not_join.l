# Test: Rows with a null key do not join. (from tests/programs/nulls/14_null_keys_do_not_join.l)

A(k: null, a: 0);
A(k: 1, a: 1);
B(k: null, b: 0);
B(k: 1, b: 1);
J(a:) :- A(k:, a:), B(k:, b:);
