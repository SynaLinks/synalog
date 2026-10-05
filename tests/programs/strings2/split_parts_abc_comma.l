# The parts of 'abc'.
# Expect: rows Q = [('abc',)]
Q(part:) distinct :- part in Split("abc", ",");
