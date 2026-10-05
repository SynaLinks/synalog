# A closure from two starting points.
# Expect: rows R = [(1,), (2,), (3,), (10,), (11,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 10, b: 11);
@Recursive(R, 5);
@OrderBy(R, "x");
R(x:) distinct :- x in [1, 10];
R(x: b) distinct :- R(x: a), E(a:, b:);
