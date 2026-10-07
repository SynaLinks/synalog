# A comparison written both ways can never hold: the rule gives no row, and
# the verifier says so.
# Expect: warning Contradictory conditions: a < b, a >= b can never all hold
# Expect: rows C = []
V(x:) :- x in [1, 2];
C(a:, b:) :- V(x: a), V(x: b), a < b, a >= b;
