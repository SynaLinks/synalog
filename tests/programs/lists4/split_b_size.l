# How many parts splitting by 'b' gives; an empty text is one empty part.
# Expect: rows Q = [(1, 2), (2, 1), (3, 2), (4, 1), (5, 1), (6, None)]
T(k: 1, s: "a,b,c");
T(k: 2, s: "");
T(k: 3, s: "abc");
T(k: 4, s: ",,");
T(k: 5, s: "x,");
T(k: 6, s: null);
@OrderBy(Q, "k");
Q(k:, n: Size(Split(s, "b"))) :- T(k:, s:);
