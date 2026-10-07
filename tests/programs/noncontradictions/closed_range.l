# Conditions that can hold: no contradiction warning.
# Expect: quiet
# Expect: rows C = [(3,)]
V(x:) :- x in [2, 3, 4];
C(x:) :- V(x:), x >= 3, x <= 3;
