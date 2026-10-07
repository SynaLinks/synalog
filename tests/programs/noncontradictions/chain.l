# Conditions that can hold: no contradiction warning.
# Expect: quiet
# Expect: rows C = [(1, 2, 3)]
V(x:) :- x in [1, 2, 3];
C(a:, b:, c:) :- V(x: a), V(x: b), V(x: c), a < b, b < c;
