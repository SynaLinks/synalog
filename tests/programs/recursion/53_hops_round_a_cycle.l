# The hops from 1 round a cycle, up to the depth: each step finds a row it never
# found (the hops grow), so the depth alone ends the recursion.
# Expect: rows P = [(1, 0), (2, 1), (3, 2), (1, 3), (2, 4), (3, 5)]
E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 1);
@Recursive(P, 5);
@OrderBy(P, "h");
P(n: 1, h: 0) distinct;
P(n: b, h: h + 1) distinct :- P(n: a, h:), E(a:, b:);
