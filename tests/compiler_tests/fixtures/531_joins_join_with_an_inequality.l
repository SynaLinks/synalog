# Test: Joining on an inequality. (from tests/programs/joins/19_join_with_an_inequality.l)

A(x:) :- x in [1, 2, 3];
@OrderBy(J, "a", "b");
J(a:, b:) :- A(x: a), A(x: b), b > a;
