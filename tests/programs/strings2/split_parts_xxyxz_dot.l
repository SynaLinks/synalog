# The parts of 'x.y.z'.
# Expect: rows Q = [('x',), ('y',), ('z',)]
@OrderBy(Q, "part");
Q(part:) distinct :- part in Split("x.y.z", ".");
