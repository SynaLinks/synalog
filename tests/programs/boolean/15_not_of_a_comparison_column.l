# Negating a comparison stored in a column.
# Expect: rows B = [(2,)]
V(x:) :- x in [2, 7];
C(x:, big: x > 5) :- V(x:);
B(x:) :- C(x:, big:), !big;
