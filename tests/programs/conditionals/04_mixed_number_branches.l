# A conditional mixing an integer and a fraction.
# Expect: rows C = [(-1, 2.0), (1, 1.5)]
V(x:) :- x in [-1, 1];
@OrderBy(C, "x");
C(x:, y: (if x > 0 then 1.5 else 2)) :- V(x:);
