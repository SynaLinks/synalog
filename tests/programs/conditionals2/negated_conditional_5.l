# Rows not flagged by a conditional above 5.
# Expect: rows Q = [(1,), (2,), (3,), (4,)]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
Flag(k:) :- V(k:, x:), (if x > 5 then true else false) == true;
@OrderBy(Q, "k");
Q(k:) :- V(k:), ~Flag(k:);
