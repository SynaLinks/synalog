# Test: The number of reachable pairs of a cycle graph. (from tests/programs/rshapes/count_pairs_cycle.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 1);
@Recursive(P, 8);
P(a:, b:) distinct :- E(a:, b:);
P(a:, b: c) distinct :- P(a:, b:), E(a: b, b: c);
C(n? += 1) distinct :- P(a:, b:);
