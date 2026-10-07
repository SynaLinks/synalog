# Triangle numbers, step by step.
# Expect: rows T = [(1, 1), (2, 3), (3, 6), (4, 10), (5, 15), (6, 21)]
@Recursive(T, -1);
@OrderBy(T, "n");
T(n: 1, t: 1) distinct;
T(n: n + 1, t: t + n + 1) distinct :- T(n:, t:), n < 6;
