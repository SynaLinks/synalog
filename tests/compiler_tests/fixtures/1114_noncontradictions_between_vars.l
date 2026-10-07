# Test: Conditions that can hold: no contradiction warning. (from tests/programs/noncontradictions/between_vars.l)

V(x:) :- x in [1, 2, 3];
C(a:, b:) :- V(x: a), V(x: b), a < b, a > 1;
