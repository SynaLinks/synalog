# Test: Part 1 of a text split by a comma, null past the end. (from tests/programs/lists4/split_comma_element_1.l)

T(k: 1, s: "a,b,c");
T(k: 2, s: "");
T(k: 3, s: "abc");
T(k: 4, s: ",,");
T(k: 5, s: "x,");
T(k: 6, s: null);
@OrderBy(Q, "k");
Q(k:, v: Element(Split(s, ","), 1)) :- T(k:, s:);
