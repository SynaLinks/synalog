# Round(2.5) == 3.
# Expect: rows Q = [(1,)]
Q(x: 1) :- Round(2.5) == 3;
