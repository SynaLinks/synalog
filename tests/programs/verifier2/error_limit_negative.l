# Refused: limit negative.
# Expect: error the limit must be a whole number of rows, 0 or more
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Limit(Q, -1);
Q(n:) :- N(n:);
