# Test: Two values forced equal, then required to differ. (from tests/programs/contradictions/04_equal_and_different.l)

V(x:) :- x in [1, 2];
C(a:) :- V(x: a), V(x: b), a <= b, b <= a, a != b;
