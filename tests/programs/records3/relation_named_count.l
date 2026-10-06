# A relation may have a built-in function's name: it is never called.
# Expect: rows Q = [(1,), (2,)]
Count(x: 1);
Count(x: 2);
@OrderBy(Q, "x");
Q(x:) :- Count(x:);
