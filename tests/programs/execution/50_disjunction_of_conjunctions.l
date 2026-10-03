# (a, b) | c in a body.
# Expect: rows Pick = [(1,), (4,)]
V(x:) :- x in [1, 2, 3, 4];
@OrderBy(Pick, "x");
Pick(x:) :- V(x:), ((x > 0, x < 2) | x == 4);
