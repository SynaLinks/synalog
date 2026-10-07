# Test: Min= over [4, 1, 7, 1]. (from tests/programs/aggregates/op_min.l)

V(x:) :- x in [4, 1, 7, 1];
A(v? Min= x) distinct :- V(x:);
