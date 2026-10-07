# A program the verifier accepts: concise combine.
# Expect: valid
# Expect: rows Q = [(1, 1), (2, 1)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:, c? += 1) distinct :- N(n:), E(a: n);
