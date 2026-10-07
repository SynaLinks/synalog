# Test: Rules computing the column differently. (from tests/programs/unions/06_different_expressions.l)

V(x: 1);
W(y: 5);
@OrderBy(U, "z");
U(z: x * 2) :- V(x:);
U(z: y * 2) :- W(y:);
