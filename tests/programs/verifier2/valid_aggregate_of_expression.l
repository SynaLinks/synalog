# A program the verifier accepts: aggregate of expression.
# Expect: valid
# Expect: rows Q = [(8,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(t? += a * b) distinct :- E(a:, b:);
