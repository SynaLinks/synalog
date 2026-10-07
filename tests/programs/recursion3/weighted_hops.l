# Fewest steps from 1 in the weighted graph.
# Expect: rows D = [(1, 0), (2, 1), (3, 1), (4, 2), (5, 3)]
E(a: 1, b: 2, w: 10);
E(a: 1, b: 3, w: 1);
E(a: 3, b: 2, w: 1);
E(a: 2, b: 4, w: 1);
E(a: 3, b: 4, w: 8);
E(a: 4, b: 5, w: 1);
E(a: 5, b: 2, w: 1);
@Recursive(D, -1);
@OrderBy(D, "n");
D(n: 1, d? Min= 0) distinct;
D(n: b, d? Min= d + 1) distinct :- D(n: a, d:), E(a:, b:);
