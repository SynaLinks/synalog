# Rules computing the column differently.
# Expect: rows U = [(2,), (10,)]
V(x: 1);
W(y: 5);
@OrderBy(U, "z");
U(z: x * 2) :- V(x:);
U(z: y * 2) :- W(y:);
