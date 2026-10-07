# Least total weight from 1 in the chain graph.
# Expect: rows D = [(1, 0), (2, 3), (3, 4), (4, 8), (5, 10), (6, 11)]
E(a: 1, b: 2, w: 3);
E(a: 2, b: 3, w: 1);
E(a: 3, b: 4, w: 4);
E(a: 4, b: 5, w: 2);
E(a: 5, b: 6, w: 1);
@Recursive(D, -1);
@OrderBy(D, "n");
D(n: 1, d? Min= 0) distinct;
D(n: b, d? Min= d + w) distinct :- D(n: a, d:), E(a:, b:, w:);
