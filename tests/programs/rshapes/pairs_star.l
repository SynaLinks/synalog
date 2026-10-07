# All reachable pairs of a star graph.
# Expect: rows P = [(1, 2), (1, 3), (1, 4)]
E(a: 1, b: 2);
E(a: 1, b: 3);
E(a: 1, b: 4);
@Recursive(P, 8);
@OrderBy(P, "a", "b");
P(a:, b:) distinct :- E(a:, b:);
P(a:, b: c) distinct :- P(a:, b:), E(a: b, b: c);
