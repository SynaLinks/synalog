# A boolean column choosing a branch.
# Expect: rows B = [(1, "small"), (3, "big")]
V(x:) :- x in [1, 3];
C(x:, big: x > 2) :- V(x:);
@OrderBy(B, "x");
B(x:, w: (if big then "big" else "small")) :- C(x:, big:);
