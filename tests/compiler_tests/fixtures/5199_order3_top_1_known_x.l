# Test: The 1 greatest known x, ties by k. (from tests/programs/order3/top_1_known_x.l)

R(k: 1, x: 5, s: "b", b: true);
R(k: 2, x: null, s: "a", b: false);
R(k: 3, x: 2, s: null, b: true);
R(k: 4, x: 5, s: "c", b: null);
R(k: 5, x: -1, s: "B", b: false);
R(k: 6, x: 2, s: "a", b: true);
R(k: 7, x: null, s: null, b: false);
R(k: 8, x: 9, s: "aa", b: true);
@OrderBy(Q, "x desc", "k");
@Limit(Q, 1);
Q(k:, x:) :- R(k:, x:), x is not null;
