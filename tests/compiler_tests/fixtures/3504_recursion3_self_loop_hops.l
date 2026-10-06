# Test: Fewest steps from 1 in the self_loop graph. (from tests/programs/recursion3/self_loop_hops.l)

E(a: 1, b: 1, w: 1);
E(a: 1, b: 2, w: 3);
E(a: 2, b: 2, w: 1);
E(a: 2, b: 3, w: 1);
@Recursive(D, -1);
@OrderBy(D, "n");
D(n: 1, d? Min= 0) distinct;
D(n: b, d? Min= d + 1) distinct :- D(n: a, d:), E(a:, b:);
