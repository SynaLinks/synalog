# Test: The first part splitting by ','. (from tests/programs/lists4/split_comma_first.l)

T(k: 1, s: "a,b,c");
T(k: 2, s: "");
T(k: 3, s: "abc");
T(k: 4, s: ",,");
T(k: 5, s: "x,");
T(k: 6, s: null);
@OrderBy(Q, "k");
Q(k:, v: Element(Split(s, ","), 0)) :- T(k:, s:);
