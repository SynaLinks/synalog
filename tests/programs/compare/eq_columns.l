# Pairs of values with a == b.
# Expect: rows C = [(1, 1), (2, 2)]
V(x:) :- x in [1, 2];
@OrderBy(C, "a", "b");
C(a:, b:) :- V(x: a), V(x: b), a == b;
