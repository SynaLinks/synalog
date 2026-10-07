# Test: A chain of 5 branches. (from tests/programs/conditionals2/chain_5_branches.l)

V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if x is null then null else if x < 0 then 0 else if x < 3 then 1 else if x < 6 then 2 else if x < 9 then 3 else 4)) :- V(k:, x:);
