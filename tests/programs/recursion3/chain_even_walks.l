# Nodes at the end of a walk of even length from 1 in the chain graph.
# Expect: rows Even = [(1,), (3,), (5,)]
E(a: 1, b: 2, w: 3);
E(a: 2, b: 3, w: 1);
E(a: 3, b: 4, w: 4);
E(a: 4, b: 5, w: 2);
E(a: 5, b: 6, w: 1);
@OrderBy(Even, "x");
@Recursive(Even, -1);
@Recursive(Odd, -1);
Even(x: 1) distinct;
Even(x: b) distinct :- Odd(x: a), E(a:, b:);
Odd(x: b) distinct :- Even(x: a), E(a:, b:);
