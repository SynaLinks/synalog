# Test: Fibonacci numbers as consecutive pairs. (from tests/programs/recursion3/fibonacci_pairs.l)

@Recursive(F, -1);
@OrderBy(F, "a", "b");
F(a: 0, b: 1) distinct;
F(a: b, b: a + b) distinct :- F(a:, b:), b < 20;
