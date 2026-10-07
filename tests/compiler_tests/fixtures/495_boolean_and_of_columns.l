# Test: The conjunction of two boolean columns. (from tests/programs/boolean/11_and_of_columns.l)

V(x:) :- x in [1, 2, 3, 4];
C(x:, even: x % 2 == 0, big: x > 2) :- V(x:);
B(x:) :- C(x:, even:, big:), even && big;
