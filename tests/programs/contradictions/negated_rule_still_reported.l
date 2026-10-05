# The contradictory rule is reported even when only used under a negation.
# Expect: warning Contradictory conditions: x > 5, x < 3
# Expect: rows C = [(1,), (2,)]
V(x:) :- x in [1, 2];
Bad(x:) :- V(x:), x > 5, x < 3;
@OrderBy(C, "x");
C(x:) :- V(x:), ~Bad(x:);
