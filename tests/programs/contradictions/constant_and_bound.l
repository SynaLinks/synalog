# Conditions that can never all hold.
# Expect: warning Contradictory conditions
# Expect: warning x > 3
# Expect: rows C = []
V(x:) :- x in [1, 2];
C(x:) :- V(x:), x == 2, x > 3;
