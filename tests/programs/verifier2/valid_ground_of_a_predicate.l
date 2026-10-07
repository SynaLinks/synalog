# A program the verifier accepts: ground of a predicate.
# Expect: valid
# Expect: rows Q = [(2,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Ground(G);
G(n:) :- N(n:), n > 1;
Q(c? += 1) distinct :- G(n:);
