# The lengths of the paths from a node, bounded.
# Expect: rows P = [(2, 1), (3, 1), (3, 2), (4, 2), (4, 3)]
E(a: 1, b: 2);
E(a: 1, b: 3);
E(a: 2, b: 3);
E(a: 3, b: 4);
@Recursive(P, 5);
@OrderBy(P, "n", "l");
P(n: b, l: 1) distinct :- E(a: 1, b:);
P(n: b, l: l + 1) distinct :- P(n: a, l:), E(a:, b:), l < 3;
