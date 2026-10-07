# Clamping a value.
# Expect: rows C = [(-5, 0), (5, 5), (15, 10)]
V(x:) :- x in [-5, 5, 15];
@OrderBy(C, "x");
C(x:, c: (if x < 0 then 0 else if x > 10 then 10 else x)) :- V(x:);
