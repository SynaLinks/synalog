# Test: The sum of the values above 10, by a conditional. (from tests/programs/conditionals2/sum_above_10.l)

V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
Q(t? += (if x > 10 then x else 0)) distinct :- V(x:);
