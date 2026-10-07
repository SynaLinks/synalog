# Test: A recursion with two base rules. (from tests/programs/recursion/31_two_base_rules.l)

@Recursive(R, 3);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: 10) distinct;
R(x: x + 1) distinct :- R(x:), x % 10 == 0 || x == 1;
