# Test: Distances from 1 in a chain graph. (from tests/programs/rshapes/distance_chain.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 4);
@Recursive(D, 8);
@OrderBy(D, "n");
D(n: 1, d? Min= 0) distinct;
D(n: b, d? Min= d + 1) distinct :- D(n: a, d:), E(a:, b:);
