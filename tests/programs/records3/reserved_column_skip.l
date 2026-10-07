# A column named skip.
# Expect: rows Q = [(1,), (2,)]
V(skip: 1);
V(skip: 2);
@OrderBy(Q, "skip");
Q(skip:) :- V(skip:);
