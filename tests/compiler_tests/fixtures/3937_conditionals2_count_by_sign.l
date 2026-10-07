# Test: Rows per sign, the nulls their own group. (from tests/programs/conditionals2/count_by_sign.l)

V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "g");
Q(g: (if x is null then null else if x > 0 then 1 else if x < 0 then -1 else 0), n? += 1) distinct :- V(x:);
