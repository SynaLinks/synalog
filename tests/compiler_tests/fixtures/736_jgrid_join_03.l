# Test: Joining [1, 1] with [1]. (from tests/programs/jgrid/join_03.l)

A(x: 1);
A(x: 1);
B(x: 1);
@OrderBy(J, "x");
J(x:) :- A(x:), B(x:);
