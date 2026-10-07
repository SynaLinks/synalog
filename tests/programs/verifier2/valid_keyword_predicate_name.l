# A program the verifier accepts: keyword predicate name.
# Expect: valid
# Expect: rows Q = [(3,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Order, "n");
Order(n:) :- N(n:);
Q(n:) :- Order(n:), n > 2;
