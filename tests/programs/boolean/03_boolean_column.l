# A comparison as a column.
# Expect: rows B = [(1, False), (3, True)]
V(x:) :- x in [1, 3];
@OrderBy(B, "x");
B(x:, big: x > 2) :- V(x:);
