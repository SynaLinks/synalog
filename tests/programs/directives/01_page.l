# compile(limit=, offset=) pages through ordered rows.
# Expect: page V 2 0 = [(1,), (2,)]
# Expect: page V 2 2 = [(3,), (4,)]
# Expect: page V 2 4 = [(5,)]
# Expect: page V 2 6 = []
@OrderBy(V, "x");
V(x:) :- x in [5, 3, 1, 4, 2];
