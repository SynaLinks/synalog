# A conditional that is null in one branch.
# Expect: rows C = [(1, "small"), (2, None)]
V(x:) :- x in [1, 2];
@OrderBy(C, "x");
C(x:, w: (if x < 2 then "small" else null)) :- V(x:);
