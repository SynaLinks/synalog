# Refused: recursive text depth.
# Expect: error the depth is a whole number
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Recursive(Q, "3");
Q(x: 1) distinct;
Q(x: b) distinct :- Q(x: a), E(a:, b:);
