# Test: Joining [1, 2] with [1, 1]. (from tests/programs/jgrid/join_04.l)

A(x: 1);
A(x: 2);
B(x: 1);
B(x: 1);
@OrderBy(J, "x");
J(x:) :- A(x:), B(x:);
