# All reachable pairs of a two_parts graph.
# Expect: rows P = [(1, 2), (3, 4)]
E(a: 1, b: 2);
E(a: 3, b: 4);
@Recursive(P, 8);
@OrderBy(P, "a", "b");
P(a:, b:) distinct :- E(a:, b:);
P(a:, b: c) distinct :- P(a:, b:), E(a: b, b: c);
