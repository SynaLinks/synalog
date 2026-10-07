# Test: Nodes at the end of a walk of odd length from 1 in the cycle graph. (from tests/programs/recursion3/cycle_odd_walks.l)

E(a: 1, b: 2, w: 2);
E(a: 2, b: 3, w: 2);
E(a: 3, b: 4, w: 2);
E(a: 4, b: 1, w: 2);
E(a: 4, b: 5, w: 7);
@OrderBy(Odd, "x");
@Recursive(Even, -1);
@Recursive(Odd, -1);
Even(x: 1) distinct;
Even(x: b) distinct :- Odd(x: a), E(a:, b:);
Odd(x: b) distinct :- Even(x: a), E(a:, b:);
