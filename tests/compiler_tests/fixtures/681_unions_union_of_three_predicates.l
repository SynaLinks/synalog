# Test: A predicate fed by three predicates. (from tests/programs/unions/12_union_of_three_predicates.l)

A(x: 1);
B(x: 2);
C(x: 3);
@OrderBy(U, "x");
U(x:) :- A(x:) | B(x:) | C(x:);
