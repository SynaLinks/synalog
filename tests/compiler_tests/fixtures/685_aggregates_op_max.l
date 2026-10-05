# Test: Max= over [4, 1, 7, 1]. (from tests/programs/aggregates/op_max.l)

V(x:) :- x in [4, 1, 7, 1];
A(v? Max= x) distinct :- V(x:);
