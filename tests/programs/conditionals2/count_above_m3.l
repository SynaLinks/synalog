# How many values are above -3, by a conditional.
# Expect: rows Q = [(4,)]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
Q(n? += (if x > -3 then 1 else 0)) distinct :- V(x:), x is not null;
