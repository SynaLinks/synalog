# Refused: dataset not a name.
# Expect: error is not a schema name
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Dataset("a b");
Q(n:) :- N(n:);
