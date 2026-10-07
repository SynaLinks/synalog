# A list with a null holds its other elements.
# Expect: rows Q = [(1,), (3,)]
@OrderBy(Q, "x");
Q(x:) :- x in [1, null, 3], x is not null;
