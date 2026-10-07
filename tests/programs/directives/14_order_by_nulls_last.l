# NULLS FIRST / NULLS LAST after the direction.
# Expect: rows V = [(2,), (1,), (None,)]
@OrderBy(V, "x DESC NULLS LAST");
V(x: 1);
V(x: 2);
V(x: null);
