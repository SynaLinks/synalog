# Test: A list chosen, then its size. (from tests/programs/conditionals2/list_branches.l)

V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: Size(if x > 0 then [1, 2, 3] else [9])) :- V(k:, x:, s:);
