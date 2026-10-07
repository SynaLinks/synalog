# A join on a conditional key.
# Expect: rows Q = [(1, 'pos'), (2, 'neg'), (3, 'zero'), (5, 'pos'), (6, 'pos')]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
L(g: 1, name: "pos");
L(g: -1, name: "neg");
L(g: 0, name: "zero");
@OrderBy(Q, "k");
Q(k:, name:) :- V(k:, x:), L(g: (if x > 0 then 1 else if x < 0 then -1 else 0), name:), x is not null;
