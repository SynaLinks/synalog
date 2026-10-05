# Test: A conditional mixing an integer and a fraction. (from tests/programs/conditionals/04_mixed_number_branches.l)

V(x:) :- x in [-1, 1];
@OrderBy(C, "x");
C(x:, y: (if x > 0 then 1.5 else 2)) :- V(x:);
