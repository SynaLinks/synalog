# Test: Null keys in columns of several rows never meet. (from tests/programs/joins3/null_key_in_a_column.l)

A(k: null, a: 1);
A(k: 5, a: 2);
A(k: null, a: 3);
B(k: null, b: 10);
B(k: 5, b: 20);
Q(a:, b:) :- A(k:, a:), B(k:, b:);
