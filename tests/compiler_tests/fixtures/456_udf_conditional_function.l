# Test: A function whose value is a conditional. (from tests/programs/udf/04_conditional_function.l)

SignOf(x) = (if x > 0 then 1 else if x < 0 then -1 else 0);
V(x:) :- x in [-2, 0, 5];
@OrderBy(S, "x");
S(x:, s: SignOf(x)) :- V(x:);
