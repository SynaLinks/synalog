# A program the verifier accepts: combine in a condition.
# Expect: valid
# Expect: rows Q = [(1,), (2,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:) :- N(n:), (combine += 1 :- E(a: n)) == 1;
