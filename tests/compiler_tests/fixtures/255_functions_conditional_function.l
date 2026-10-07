# Test: A function with a conditional. (from tests/programs/functions/04_conditional_function.l)

SignOf(x) = (if x < 0 then -1 else 1);
V(x:) :- x in [5, -5];
@OrderBy(R, "x");
R(s:, x:) :- V(x:), s == SignOf(x);
