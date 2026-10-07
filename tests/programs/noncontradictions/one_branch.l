# Conditions that can hold: no contradiction warning.
# Expect: quiet
# Expect: rows C = [(9,)]
V(x:) :- x in [1, 5, 9];
C(x:) :- V(x:), (x < 3 | x > 7), x != 1;
