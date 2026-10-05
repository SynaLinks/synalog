# Test: The step at which each node is first reached. (from tests/programs/recursion/41_count_steps.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
@Recursive(S, 5);
@OrderBy(S, "x");
S(x: 1, s? Min= 0) distinct;
S(x: b, s? Min= s + 1) distinct :- S(x: a, s:), E(a:, b:);
