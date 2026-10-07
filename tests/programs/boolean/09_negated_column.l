# Negating a boolean column.
# Expect: rows B = [(1,)]
V(x:) :- x in [1, 3];
C(x:, big: x > 2) :- V(x:);
B(x:) :- C(x:, big:), !big;
