# Test: A negation with a constant column. (from tests/programs/negation/02_negation_with_a_constant.l)

V(x:) :- x in [1, 2];
Edge(a: 2, b: 2);
@OrderBy(Out, "x");
Out(x:) :- V(x:), ~Edge(a: x, b: 2);
