# A disjunction inside a body, then a join.
# Expect: rows J = [(1, "a"), (2, "b")]
A(x: 1);
B(x: 2);
N(x: 1, s: "a");
N(x: 2, s: "b");
N(x: 3, s: "c");
@OrderBy(J, "x");
J(x:, s:) :- (A(x:) | B(x:)), N(x:, s:);
