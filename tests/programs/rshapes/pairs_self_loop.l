# All reachable pairs of a self_loop graph.
# Expect: rows P = [(1, 1), (1, 2)]
E(a: 1, b: 1);
E(a: 1, b: 2);
@Recursive(P, 8);
@OrderBy(P, "a", "b");
P(a:, b:) distinct :- E(a:, b:);
P(a:, b: c) distinct :- P(a:, b:), E(a: b, b: c);
