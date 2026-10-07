# Test: Triangle numbers, step by step. (from tests/programs/recursion3/triangle_numbers.l)

@Recursive(T, -1);
@OrderBy(T, "n");
T(n: 1, t: 1) distinct;
T(n: n + 1, t: t + n + 1) distinct :- T(n:, t:), n < 6;
