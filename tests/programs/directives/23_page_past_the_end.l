# A page past the last row is empty.
# Expect: page V 5 10 = []
@OrderBy(V, "x");
V(x:) :- x in [1, 2, 3];
