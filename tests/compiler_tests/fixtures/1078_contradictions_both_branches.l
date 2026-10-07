# Test: Conditions that can never all hold. (from tests/programs/contradictions/both_branches.l)

V(x:) :- x in [1, 2];
C(x:) :- V(x:), (x > 5 | x < 0), x == 1;
