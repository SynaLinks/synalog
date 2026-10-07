# Test: Conditions that can never all hold. (from tests/programs/contradictions/differ_from_itself.l)

V(x:) :- x in [1, 2];
C(a:) :- V(x: a), V(x: b), a == b, b != a;
