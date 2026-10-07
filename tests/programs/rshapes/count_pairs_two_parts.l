# The number of reachable pairs of a two_parts graph.
# Expect: rows C = [(2,)]
E(a: 1, b: 2);
E(a: 3, b: 4);
@Recursive(P, 8);
P(a:, b:) distinct :- E(a:, b:);
P(a:, b: c) distinct :- P(a:, b:), E(a: b, b: c);
C(n? += 1) distinct :- P(a:, b:);
