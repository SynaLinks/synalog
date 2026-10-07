# Test: A conditional yielding numbers, used in arithmetic. (from tests/programs/execution/51_nested_conditional_numbers.l)

V(x:) :- x in [2, -3];
@OrderBy(Abs, "x");
Abs(x:, a:) :- V(x:), a == (if x < 0 then -x else x);
