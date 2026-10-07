# Conditions that can hold: no contradiction warning.
# Expect: quiet
# Expect: rows C = [(2,)]
V(x:) :- x in [1, 2, 3];
C(x:) :- V(x:), x == 2, x == 2.0;
