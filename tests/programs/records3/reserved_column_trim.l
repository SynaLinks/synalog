# A column named trim.
# Expect: rows Q = [(1,), (2,)]
V(trim: 1);
V(trim: 2);
@OrderBy(Q, "trim");
Q(trim:) :- V(trim:);
