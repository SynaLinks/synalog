# The numbers below 4.
# Expect: rows Q = [(0,), (1,), (2,), (3,)]
@OrderBy(Q, "x");
Q(x:) :- x in Range(4);
