# Test: A union of two rules ordered by x desc, then k. (from tests/programs/order3/union_by_x_desc.l)

R(k: 1, x: 5, s: "b", b: true);
R(k: 2, x: null, s: "a", b: false);
R(k: 3, x: 2, s: null, b: true);
R(k: 4, x: 5, s: "c", b: null);
R(k: 5, x: -1, s: "B", b: false);
R(k: 6, x: 2, s: "a", b: true);
R(k: 7, x: null, s: null, b: false);
R(k: 8, x: 9, s: "aa", b: true);
@OrderBy(Q, "x desc", "k");
Q(k:, x:) :- R(k:, x:, b: true);
Q(k: k + 10, x:) :- R(k:, x:, b: false);
