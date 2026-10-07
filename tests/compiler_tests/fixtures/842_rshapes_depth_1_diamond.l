# Test: Nodes within 1 step(s) of 1 in a diamond graph. (from tests/programs/rshapes/depth_1_diamond.l)

E(a: 1, b: 2);
E(a: 1, b: 3);
E(a: 2, b: 4);
E(a: 3, b: 4);
@Recursive(R, 1);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
