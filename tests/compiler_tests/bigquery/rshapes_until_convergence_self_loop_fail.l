# Test: Nodes reached from 1 in a self_loop graph, until nothing changes. (from tests/programs/rshapes/until_convergence_self_loop.l)

E(a: 1, b: 1);
E(a: 1, b: 2);
@Recursive(R, -1);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
