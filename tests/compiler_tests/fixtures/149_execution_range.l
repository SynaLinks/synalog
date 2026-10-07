# Test: Range(n) is 0 .. n-1. (from tests/programs/execution/66_range.l)

@OrderBy(R, "x");
R(x:) :- x in Range(3);
