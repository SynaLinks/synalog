# Three branches, duplicates removed.
# Expect: rows U = [(1,), (2,), (3,)]
@OrderBy(U, "x");
U(x:) distinct :- x in [1, 2] | x in [2, 3] | x == 1;
