# Test: Powers of two below 1000, by recursion. (from tests/programs/recursion3/powers_of_two.l)

@Recursive(P, -1);
@OrderBy(P, "x");
P(x: 1) distinct;
P(x: x * 2) distinct :- P(x:), x * 2 < 1000;
