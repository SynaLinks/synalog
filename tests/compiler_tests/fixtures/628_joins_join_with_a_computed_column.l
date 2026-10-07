# Test: Joining after computing a column. (from tests/programs/joins/22_join_with_a_computed_column.l)

A(x: 1);
D(x:, y: x + 1) :- A(x:);
N(n: 2, s: "two");
J(x:, s:) :- D(x:, y:), N(n: y, s:);
