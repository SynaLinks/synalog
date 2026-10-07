# Test: Negating a comparison stored in a column. (from tests/programs/boolean/15_not_of_a_comparison_column.l)

V(x:) :- x in [2, 7];
C(x:, big: x > 5) :- V(x:);
B(x:) :- C(x:, big:), !big;
