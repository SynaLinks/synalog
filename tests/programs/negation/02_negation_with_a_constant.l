# A negation with a constant column.
# Expect: rows Out = [(1,)]
V(x:) :- x in [1, 2];
Edge(a: 2, b: 2);
@OrderBy(Out, "x");
Out(x:) :- V(x:), ~Edge(a: x, b: 2);
