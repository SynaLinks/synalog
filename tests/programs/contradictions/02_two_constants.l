# A value equal to two different constants.
# Expect: warning Contradictory conditions: k == 1, k == 2 can never all hold
# Expect: rows C = []
V(k:) :- k in [1, 2];
C(k:) :- V(k:), k == 1, k == 2;
