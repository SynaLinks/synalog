# Test: Clamping a value. (from tests/programs/conditionals/11_nested_conditional_numbers.l)

V(x:) :- x in [-5, 5, 15];
@OrderBy(C, "x");
C(x:, c: (if x < 0 then 0 else if x > 10 then 10 else x)) :- V(x:);
