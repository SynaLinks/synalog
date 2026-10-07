# A predicate fed by three predicates.
# Expect: rows U = [(1,), (2,), (3,)]
A(x: 1);
B(x: 2);
C(x: 3);
@OrderBy(U, "x");
U(x:) :- A(x:) | B(x:) | C(x:);
