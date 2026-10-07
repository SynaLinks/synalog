# The first part splitting by 'b'.
# Expect: rows Q = [(1, 'a,'), (2, ''), (3, 'a'), (4, ',,'), (5, 'x,'), (6, None)]
T(k: 1, s: "a,b,c");
T(k: 2, s: "");
T(k: 3, s: "abc");
T(k: 4, s: ",,");
T(k: 5, s: "x,");
T(k: 6, s: null);
@OrderBy(Q, "k");
Q(k:, v: Element(Split(s, "b"), 0)) :- T(k:, s:);
