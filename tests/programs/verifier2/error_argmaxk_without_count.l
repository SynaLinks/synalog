# Refused: argmaxk without count.
# Expect: error ArgMaxK is an aggregate that takes how many
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(t? ArgMaxK= n -> n) distinct :- N(n:);
