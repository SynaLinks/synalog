# Conditions that can hold: no contradiction warning.
# Expect: quiet
# Expect: rows C = [(3,)]
V(x:) :- x in [1, 2, 3];
C(x:) :- V(x:), x != 1, x != 2;
