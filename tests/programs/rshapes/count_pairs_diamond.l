# The number of reachable pairs of a diamond graph.
# Expect: rows C = [(5,)]
E(a: 1, b: 2);
E(a: 1, b: 3);
E(a: 2, b: 4);
E(a: 3, b: 4);
@Recursive(P, 8);
P(a:, b:) distinct :- E(a:, b:);
P(a:, b: c) distinct :- P(a:, b:), E(a: b, b: c);
C(n? += 1) distinct :- P(a:, b:);
