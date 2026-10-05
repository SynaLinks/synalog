# Two values forced equal, then required to differ.
# Expect: warning Contradictory conditions: a <= b, b <= a, a != b can never all hold
# Expect: rows C = []
V(x:) :- x in [1, 2];
C(a:) :- V(x: a), V(x: b), a <= b, b <= a, a != b;
