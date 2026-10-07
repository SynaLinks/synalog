# Test: Only the equal non-null keys meet. (from tests/programs/joins3/null_key_with_values.l)

A(k: null, a: 1);
A(k: 5, a: 2);
B(k: null, b: 10);
B(k: 5, b: 20);
Q(a:, b:) :- A(k:, a:), B(k:, b:);
