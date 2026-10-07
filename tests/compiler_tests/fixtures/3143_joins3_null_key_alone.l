# Test: Two nulls are not equal: no row. (from tests/programs/joins3/null_key_alone.l)

A(k: null, a: 1);
B(k: null, b: 2);
Q(a:, b:) :- A(k:, a:), B(k:, b:);
