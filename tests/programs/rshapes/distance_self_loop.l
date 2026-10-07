# Distances from 1 in a self_loop graph.
# Expect: rows D = [(1, 0), (2, 1)]
E(a: 1, b: 1);
E(a: 1, b: 2);
@Recursive(D, 8);
@OrderBy(D, "n");
D(n: 1, d? Min= 0) distinct;
D(n: b, d? Min= d + 1) distinct :- D(n: a, d:), E(a:, b:);
