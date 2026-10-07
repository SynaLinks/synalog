# Fibonacci numbers as consecutive pairs.
# Expect: rows F = [(0, 1), (1, 1), (1, 2), (2, 3), (3, 5), (5, 8), (8, 13), (13, 21)]
@Recursive(F, -1);
@OrderBy(F, "a", "b");
F(a: 0, b: 1) distinct;
F(a: b, b: a + b) distinct :- F(a:, b:), b < 20;
