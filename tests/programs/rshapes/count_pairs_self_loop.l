# The number of reachable pairs of a self_loop graph.
# Expect: rows C = [(2,)]
E(a: 1, b: 1);
E(a: 1, b: 2);
@Recursive(P, 8);
P(a:, b:) distinct :- E(a:, b:);
P(a:, b: c) distinct :- P(a:, b:), E(a: b, b: c);
C(n? += 1) distinct :- P(a:, b:);
