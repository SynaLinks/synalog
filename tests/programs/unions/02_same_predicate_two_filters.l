# One predicate filtered two ways.
# Expect: rows U = [(1,), (4,)]
V(x:) :- x in [1, 2, 3, 4];
@OrderBy(U, "x");
U(x:) distinct :- V(x:), (x < 2 | x > 3);
