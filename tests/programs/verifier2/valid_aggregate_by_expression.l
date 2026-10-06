# A program the verifier accepts: aggregate by expression.
# Expect: valid
# Expect: rows Q = [(False, 1), (True, 1)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "odd");
Q(odd: a % 2 == 1, n? += 1) distinct :- E(a:);
