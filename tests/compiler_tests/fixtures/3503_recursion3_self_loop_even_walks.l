# Test: Nodes at the end of a walk of even length from 1 in the self_loop graph. (from tests/programs/recursion3/self_loop_even_walks.l)

E(a: 1, b: 1, w: 1);
E(a: 1, b: 2, w: 3);
E(a: 2, b: 2, w: 1);
E(a: 2, b: 3, w: 1);
@Recursive(Odd, -1);
Odd(x: b) distinct :- Even(x: a), E(a:, b:);
@OrderBy(Even, "x");
@Recursive(Even, -1);
Even(x: 1) distinct;
Even(x: b) distinct :- Odd(x: a), E(a:, b:);
