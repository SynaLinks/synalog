# Test: Rows not flagged by a conditional above 2. (from tests/programs/conditionals2/negated_conditional_2.l)

V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
Flag(k:) :- V(k:, x:), (if x > 2 then true else false) == true;
@OrderBy(Q, "k");
Q(k:) :- V(k:), ~Flag(k:);
