# | unions two bodies.
# Expect: valid

A(x:) :- x in [1];
B(x:) :- x in [2];
AOrB(x:) :- A(x:) | B(x:);
