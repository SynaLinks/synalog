# A page of a predicate of two rules.
# Expect: page U 2 1 = [(2,), (3,)]
@OrderBy(U, "x");
U(x:) :- x in [1, 3];
U(x:) :- x in [2, 4];
