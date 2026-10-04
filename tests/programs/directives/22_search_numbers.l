# search matches numbers as text.
# Expect: search V 2 = [(2,), (12,)]
@OrderBy(V, "x");
V(x:) :- x in [1, 2, 12];
