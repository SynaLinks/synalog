# Test: Negating a boolean column. (from tests/programs/boolean/09_negated_column.l)

V(x:) :- x in [1, 3];
C(x:, big: x > 2) :- V(x:);
B(x:) :- C(x:, big:), !big;
