# A relation may have a built-in function's name: it is never called.
# Expect: rows Q = [(1,), (2,)]
Date(x: 1);
Date(x: 2);
@OrderBy(Q, "x");
Q(x:) :- Date(x:);
