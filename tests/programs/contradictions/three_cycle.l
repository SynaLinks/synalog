# Conditions that can never all hold.
# Expect: warning Contradictory conditions
# Expect: warning c < a
# Expect: rows C = []
V(x:) :- x in [1, 2];
C(a:) :- V(x: a), V(x: b), V(x: c), a < b, b < c, c < a;
