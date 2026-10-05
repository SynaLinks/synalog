# The disjunction of two boolean columns.
# Expect: rows B = [(1,), (4,)]
V(x:) :- x in [1, 2, 3, 4];
C(x:, small: x < 2, big: x > 3) :- V(x:);
@OrderBy(B, "x");
B(x:) :- C(x:, small:, big:), small || big;
