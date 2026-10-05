# Test: Joining [1] with [2]. (from tests/programs/jgrid/join_02.l)

A(x: 1);
B(x: 2);
@OrderBy(J, "x");
J(x:) :- A(x:), B(x:);
