# A relation may have a built-in function's name: it is never called.
# Expect: rows Q = [(1,), (2,)]
Rank(x: 1);
Rank(x: 2);
@OrderBy(Q, "x");
Q(x:) :- Rank(x:);
