# Test: The disjunction of two boolean columns. (from tests/programs/boolean/13_or_of_columns.l)

V(x:) :- x in [1, 2, 3, 4];
C(x:, small: x < 2, big: x > 3) :- V(x:);
@OrderBy(B, "x");
B(x:) :- C(x:, small:, big:), small || big;
