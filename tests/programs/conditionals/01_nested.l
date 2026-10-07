# A conditional with several branches.
# Expect: rows C = [(1, "one"), (2, "two"), (3, "many")]
V(x:) :- x in [1, 2, 3];
@OrderBy(C, "x");
C(x:, w: (if x == 1 then "one" else if x == 2 then "two" else "many")) :- V(x:);
