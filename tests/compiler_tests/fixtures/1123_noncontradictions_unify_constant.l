# Test: Conditions that can hold: no contradiction warning. (from tests/programs/noncontradictions/unify_constant.l)

V(x:) :- x in [1, 2];
C(x:) :- V(x:), x == 2, x > 1;
