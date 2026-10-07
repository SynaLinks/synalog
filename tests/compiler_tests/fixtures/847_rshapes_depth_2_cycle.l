# Test: Nodes within 2 step(s) of 1 in a cycle graph. (from tests/programs/rshapes/depth_2_cycle.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 1);
@Recursive(R, 2);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
