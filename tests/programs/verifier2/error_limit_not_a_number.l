# Refused: limit not a number.
# Expect: error the limit must be a whole number
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Limit(Q, "x");
Q(n:) :- N(n:);
