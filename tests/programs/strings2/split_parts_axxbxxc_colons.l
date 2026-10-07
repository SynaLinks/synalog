# The parts of 'a::b::c'.
# Expect: rows Q = [('a',), ('b',), ('c',)]
@OrderBy(Q, "part");
Q(part:) distinct :- part in Split("a::b::c", "::");
