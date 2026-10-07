# The parts of ''.
# Expect: rows Q = [('',)]
Q(part:) distinct :- part in Split("", ",");
