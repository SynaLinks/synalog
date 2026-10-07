# Test: The rows of A that have a match in B, once each. (from tests/programs/joins/24_semi_join_by_distinct.l)

A(x: 1);
A(x: 2);
B(x: 1);
B(x: 1);
J(x:) distinct :- A(x:), B(x:);
