# Conditions that can hold: no contradiction warning.
# Expect: quiet
# Expect: rows C = [(1,), (2,)]
V(x:) :- x in [1, 2];
@OrderBy(C, "x");
C(x:) :- V(x:), x + 1 > x;
