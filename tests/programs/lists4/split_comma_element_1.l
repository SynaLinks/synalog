# Part 1 of a text split by a comma, null past the end.
# Expect: rows Q = [(1, 'b'), (2, None), (3, None), (4, ''), (5, ''), (6, None)]
T(k: 1, s: "a,b,c");
T(k: 2, s: "");
T(k: 3, s: "abc");
T(k: 4, s: ",,");
T(k: 5, s: "x,");
T(k: 6, s: null);
@OrderBy(Q, "k");
Q(k:, v: Element(Split(s, ","), 1)) :- T(k:, s:);
