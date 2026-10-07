# Integers as fractions, divided.
# Expect: rows C = [(1, 0.5), (3, 1.5)]
V(x:) :- x in [1, 3];
@OrderBy(C, "x");
C(x:, h: ToFloat64(x) / 2) :- V(x:);
