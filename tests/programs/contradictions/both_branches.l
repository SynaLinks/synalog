# Conditions that can never all hold.
# Expect: warning Contradictory conditions
# Expect: warning x == 1
# Expect: rows C = []
V(x:) :- x in [1, 2];
C(x:) :- V(x:), (x > 5 | x < 0), x == 1;
