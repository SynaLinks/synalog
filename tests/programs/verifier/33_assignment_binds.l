# == binds a variable from bound ones.
# Expect: rows V = [(1, 2), (2, 4)]
@OrderBy(V, "x");
V(x:, y:) :- x in [1, 2], y == x * 2;
