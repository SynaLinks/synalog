# Test: | unions two bodies. (from tests/programs/verifier/14_disjunction.l)

A(x:) :- x in [1];
B(x:) :- x in [2];
@OrderBy(AOrB, "x");
AOrB(x:) :- A(x:) | B(x:);
