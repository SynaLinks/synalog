# Test: One branch of a disjunction can hold: no warning, and the row is there. (from tests/programs/contradictions/06_one_branch_holds.l)

V(x:) :- x in [1, 3, 7];
C(x:) :- V(x:), (x < 0 | x > 1), x == 3;
