# Conditions that can hold: no contradiction warning.
# Expect: quiet
# Expect: rows C = [(1, 2)]
V(x:) :- x in [1, 2, 3];
C(a:, b:) :- V(x: a), V(x: b), a < b, b <= 2;
