# Test: A join on a computed key. (from tests/programs/joins/07_join_on_a_computed_key.l)

A(k: 1);
B(k: 2);
B(k: 5);
J(a:, b:) :- A(k: a), B(k: b), b == a + 1;
