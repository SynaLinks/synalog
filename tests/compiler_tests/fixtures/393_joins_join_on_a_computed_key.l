# Test: Joining on an expression. (from tests/programs/joins/10_join_on_a_computed_key.l)

A(x: 1);
B(y: 2);
J(x:, y:) :- A(x:), B(y:), y == x + 1;
