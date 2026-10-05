# The numbers below 0.
# Expect: rows Q = []
@OrderBy(Q, "x");
Q(x:) :- x in Range(0);
