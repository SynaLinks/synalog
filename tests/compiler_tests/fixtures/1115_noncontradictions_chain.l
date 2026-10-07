# Test: Conditions that can hold: no contradiction warning. (from tests/programs/noncontradictions/chain.l)

V(x:) :- x in [1, 2, 3];
C(a:, b:, c:) :- V(x: a), V(x: b), V(x: c), a < b, b < c;
