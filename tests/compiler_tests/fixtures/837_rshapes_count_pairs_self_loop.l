# Test: The number of reachable pairs of a self_loop graph. (from tests/programs/rshapes/count_pairs_self_loop.l)

E(a: 1, b: 1);
E(a: 1, b: 2);
@Recursive(P, 8);
P(a:, b:) distinct :- E(a:, b:);
P(a:, b: c) distinct :- P(a:, b:), E(a: b, b: c);
C(n? += 1) distinct :- P(a:, b:);
