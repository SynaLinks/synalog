# Refused: aggregate in function argument.
# Expect: error 'Max' is an aggregate
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(v: Upper(Max(s))) :- N(s:);
