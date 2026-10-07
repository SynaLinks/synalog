# Test: Counting up to a bound inside the rule. (from tests/programs/recursion/51_recursion_with_a_condition_on_depth.l)

@Recursive(R, 10);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: x * 2) distinct :- R(x:), x < 8;
