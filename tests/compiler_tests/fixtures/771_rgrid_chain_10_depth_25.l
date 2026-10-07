# Test: A chain of 10 edges, at most 25 steps. (from tests/programs/rgrid/chain_10_depth_25.l)

E(a:, b: a + 1) :- a in Range(10);
@Recursive(R, 25);
@OrderBy(R, "x");
R(x: 0) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
