# Test: Avg= over [4, 1, 7, 1]. (from tests/programs/aggregates/op_avg.l)

V(x:) :- x in [4, 1, 7, 1];
A(v? Avg= x) distinct :- V(x:);
