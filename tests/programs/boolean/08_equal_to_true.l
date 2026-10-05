# Comparing a boolean column to true.
# Expect: rows B = [(3,)]
V(x:) :- x in [1, 3];
C(x:, big: x > 2) :- V(x:);
B(x:) :- C(x:, big:), big == true;
