# Test: Nodes not reached from 1 in the self_loop graph. (from tests/programs/recursion3/self_loop_unreached.l)

E(a: 1, b: 1, w: 1);
E(a: 1, b: 2, w: 3);
E(a: 2, b: 2, w: 1);
E(a: 2, b: 3, w: 1);
@Recursive(R, -1);
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
N(x: a) distinct :- E(a:);
N(x: b) distinct :- E(b:);
@OrderBy(Q, "x");
Q(x:) :- N(x:), ~R(x:);
