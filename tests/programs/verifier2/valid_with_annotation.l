# A program the verifier accepts: with annotation.
# Expect: valid
# Expect: rows Q = [(3,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@With(W);
W(n:) :- N(n:);
Q(c? += 1) distinct :- W(n:);
