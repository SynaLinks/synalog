# Test: All reachable pairs of a self_loop graph. (from tests/programs/rshapes/pairs_self_loop.l)

E(a: 1, b: 1);
E(a: 1, b: 2);
@Recursive(P, 8);
@OrderBy(P, "a", "b");
P(a:, b:) distinct :- E(a:, b:);
P(a:, b: c) distinct :- P(a:, b:), E(a: b, b: c);
