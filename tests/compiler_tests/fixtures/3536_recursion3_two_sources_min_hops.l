# Test: Fewest steps from either of two sources. (from tests/programs/recursion3/two_sources_min_hops.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 4, b: 3);
E(a: 4, b: 5);
@Recursive(D, -1);
@OrderBy(D, "n");
D(n: 1, d? Min= 0) distinct;
D(n: 4, d? Min= 0) distinct;
D(n: b, d? Min= d + 1) distinct :- D(n: a, d:), E(a:, b:);
