# Test: Absolute differences between rows. (from tests/programs/math/19_abs_of_differences.l)

V(x:) :- x in [1, 4];
@OrderBy(M, "a");
M(a:, b:, d: Abs(a - b)) :- V(x: a), V(x: b), a != b;
