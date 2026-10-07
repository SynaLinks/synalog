# The parts that are not empty, splitting by ','.
# Expect: rows Q = [(1, 'a'), (1, 'b'), (1, 'c'), (3, 'abc'), (5, 'x')]
T(k: 1, s: "a,b,c");
T(k: 2, s: "");
T(k: 3, s: "abc");
T(k: 4, s: ",,");
T(k: 5, s: "x,");
T(k: 6, s: null);
@OrderBy(Q, "k", "x");
Q(k:, x:) :- T(k:, s:), x in Split(s, ","), x != "";
