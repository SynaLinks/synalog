# Test: A value equal to two different constants. (from tests/programs/contradictions/02_two_constants.l)

V(k:) :- k in [1, 2];
C(k:) :- V(k:), k == 1, k == 2;
