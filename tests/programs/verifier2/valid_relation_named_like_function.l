# A program the verifier accepts: relation named like function.
# Expect: valid
# Expect: rows Q = [(2,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Rank(r: 1);
Rank(r: 2);
Q(r:) :- Rank(r:), r > 1;
