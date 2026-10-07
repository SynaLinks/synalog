# Test: A closure from two starting points. (from tests/programs/recursion/37_reach_from_two_sources.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 10, b: 11);
@Recursive(R, 5);
@OrderBy(R, "x");
R(x:) distinct :- x in [1, 10];
R(x: b) distinct :- R(x: a), E(a:, b:);
