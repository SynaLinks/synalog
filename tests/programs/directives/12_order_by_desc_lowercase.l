# "x desc" in lowercase.
# Expect: rows V = [(2,), (1,)]
@OrderBy(V, "x desc");
V(x:) :- x in [1, 2];
