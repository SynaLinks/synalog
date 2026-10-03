# | unions two bodies.
# Expect: valid
# Expect: rows AOrB = [(1,), (2,)]

A(x:) :- x in [1];
B(x:) :- x in [2];
@OrderBy(AOrB, "x");
AOrB(x:) :- A(x:) | B(x:);
