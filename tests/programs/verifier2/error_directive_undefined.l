# Refused: directive undefined.
# Expect: error which the program does not define
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Limit(Zz, 1);
Q(n:) :- N(n:);
