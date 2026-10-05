# Test: Conditions that can hold: no contradiction warning. (from tests/programs/noncontradictions/equal_vars.l)

V(x:) :- x in [1, 2];
@OrderBy(C, "a");
C(a:) :- V(x: a), V(x: b), a <= b, b <= a;
