# The parts of '1|2|3'.
# Expect: rows Q = [('1',), ('2',), ('3',)]
@OrderBy(Q, "part");
Q(part:) distinct :- part in Split("1|2|3", "|");
