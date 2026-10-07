# Test: Comparing a boolean column to true. (from tests/programs/boolean/08_equal_to_true.l)

V(x:) :- x in [1, 3];
C(x:, big: x > 2) :- V(x:);
B(x:) :- C(x:, big:), big == true;
