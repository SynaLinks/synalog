# Nulls sort last, ascending or descending, on every engine.
# Expect: rows A = [(1,), (3,), (None,)]
# Expect: rows D = [(3,), (1,), (None,)]
V(x: 1);
V(x: null);
V(x: 3);
@OrderBy(A, "x");
A(x:) :- V(x:);
@OrderBy(D, "x desc");
D(x:) :- V(x:);
