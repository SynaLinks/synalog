# Test: A chain of 6 edges, at most 3 steps. (from tests/programs/rgrid/chain_6_depth_3.l)

E(a:, b: a + 1) :- a in Range(6);
@Recursive(R, 3);
@OrderBy(R, "x");
R(x: 0) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
