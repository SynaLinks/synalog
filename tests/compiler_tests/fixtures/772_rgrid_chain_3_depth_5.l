# Test: A chain of 3 edges, at most 5 steps. (from tests/programs/rgrid/chain_3_depth_5.l)

E(a:, b: a + 1) :- a in Range(3);
@Recursive(R, 5);
@OrderBy(R, "x");
R(x: 0) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
