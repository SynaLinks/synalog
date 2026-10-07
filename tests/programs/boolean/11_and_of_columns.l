# The conjunction of two boolean columns.
# Expect: rows B = [(4,)]
V(x:) :- x in [1, 2, 3, 4];
C(x:, even: x % 2 == 0, big: x > 2) :- V(x:);
B(x:) :- C(x:, even:, big:), even && big;
