# Test: A join on two columns. (from tests/programs/joins/06_join_on_two_columns.l)

A(a: 1, b: 1);
A(a: 1, b: 2);
B(a: 1, b: 1, v: "x");
J(a:, b:, v:) :- A(a:, b:), B(a:, b:, v:);
