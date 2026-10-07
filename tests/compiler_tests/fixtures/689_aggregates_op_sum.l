# Test: += over [4, 1, 7, 1]. (from tests/programs/aggregates/op_sum.l)

V(x:) :- x in [4, 1, 7, 1];
A(v? += x) distinct :- V(x:);
