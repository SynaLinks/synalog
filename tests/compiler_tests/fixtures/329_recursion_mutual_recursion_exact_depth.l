# Test: Mutual recursion stops at the declared depth, which bounds both predicates. (from tests/programs/recursion/25_mutual_recursion_exact_depth.l)

@Recursive(Odd, 5);
Odd(x: y + 1) distinct :- Even(x: y);
@Recursive(Even, 5);
@OrderBy(Even, "x");
Even(x: 0) distinct;
Even(x: y + 1) distinct :- Odd(x: y);
