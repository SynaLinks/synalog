# Test: A disjunction inside a body, then a join. (from tests/programs/unions/08_disjunction_in_a_body.l)

A(x: 1);
B(x: 2);
N(x: 1, s: "a");
N(x: 2, s: "b");
N(x: 3, s: "c");
@OrderBy(J, "x");
J(x:, s:) :- (A(x:) | B(x:)), N(x:, s:);
