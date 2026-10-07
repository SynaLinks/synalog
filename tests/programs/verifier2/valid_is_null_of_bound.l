# A program the verifier accepts: is null of bound.
# Expect: valid
# Expect: rows Q = [(1,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
V(x: null);
V(x: 1);
Q(n? += 1) distinct :- V(x:), x is null;
