# A program the verifier accepts: join and filter.
# Expect: valid
# Expect: rows Q = [(1, 3)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(a:, c:) :- E(a:, b:), E(a: b, b: c);
