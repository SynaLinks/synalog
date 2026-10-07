# A lower bound above the upper bound.
# Expect: warning Contradictory conditions: x > 10, x < 5 can never all hold
# Expect: rows C = []
V(x:) :- x in [1, 7, 12];
C(x:) :- V(x:), x > 10, x < 5;
