# Test: A disjunction as a condition. (from tests/programs/conditionals2/or_condition.l)

V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if x > 10 || s is null then "yes" else "no")) :- V(k:, x:, s:);
