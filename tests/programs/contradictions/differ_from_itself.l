# Conditions that can never all hold.
# Expect: warning Contradictory conditions
# Expect: warning b != a
# Expect: rows C = []
V(x:) :- x in [1, 2];
C(a:) :- V(x: a), V(x: b), a == b, b != a;
