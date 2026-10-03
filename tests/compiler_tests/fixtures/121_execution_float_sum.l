# Test: A sum of floats. (from tests/programs/execution/38_float_sum.l)

V(x:) :- x in [0.1, 0.2, 0.3];
T(t? += x) distinct :- V(x:);
