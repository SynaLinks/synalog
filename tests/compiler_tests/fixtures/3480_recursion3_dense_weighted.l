# Test: Least total weight from 1 in the dense graph. (from tests/programs/recursion3/dense_weighted.l)

E(a: 1, b: 3, w: 2);
E(a: 1, b: 4, w: 5);
E(a: 2, b: 3, w: 4);
E(a: 2, b: 5, w: 5);
E(a: 3, b: 1, w: 5);
E(a: 3, b: 2, w: 3);
E(a: 3, b: 4, w: 4);
E(a: 3, b: 5, w: 2);
E(a: 4, b: 1, w: 2);
E(a: 4, b: 3, w: 3);
E(a: 5, b: 2, w: 2);
E(a: 5, b: 3, w: 5);
@Recursive(D, -1);
@OrderBy(D, "n");
D(n: 1, d? Min= 0) distinct;
D(n: b, d? Min= d + w) distinct :- D(n: a, d:), E(a:, b:, w:);
