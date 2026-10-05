# The parts of ',a,'.
# Expect: rows Q = [('',), ('a',)]
@OrderBy(Q, "part");
Q(part:) distinct :- part in Split(",a,", ",");
