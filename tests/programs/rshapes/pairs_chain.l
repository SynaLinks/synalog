# All reachable pairs of a chain graph.
# Expect: rows P = [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 4)]
E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 4);
@Recursive(P, 8);
@OrderBy(P, "a", "b");
P(a:, b:) distinct :- E(a:, b:);
P(a:, b: c) distinct :- P(a:, b:), E(a: b, b: c);
