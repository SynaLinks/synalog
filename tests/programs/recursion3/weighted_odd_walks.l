# Nodes at the end of a walk of odd length from 1 in the weighted graph.
# Expect: rows Odd = [(2,), (3,), (4,), (5,)]
E(a: 1, b: 2, w: 10);
E(a: 1, b: 3, w: 1);
E(a: 3, b: 2, w: 1);
E(a: 2, b: 4, w: 1);
E(a: 3, b: 4, w: 8);
E(a: 4, b: 5, w: 1);
E(a: 5, b: 2, w: 1);
@OrderBy(Odd, "x");
@Recursive(Even, -1);
@Recursive(Odd, -1);
Even(x: 1) distinct;
Even(x: b) distinct :- Odd(x: a), E(a:, b:);
Odd(x: b) distinct :- Even(x: a), E(a:, b:);
