# Test: Conditions that can hold: no contradiction warning. (from tests/programs/noncontradictions/one_branch.l)

V(x:) :- x in [1, 5, 9];
C(x:) :- V(x:), (x < 3 | x > 7), x != 1;
