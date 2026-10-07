# Conditions that can hold: no contradiction warning.
# Expect: quiet
# Expect: rows C = [(2, 3)]
V(x:) :- x in [1, 2, 3];
C(a:, b:) :- V(x: a), V(x: b), a < b, a > 1;
