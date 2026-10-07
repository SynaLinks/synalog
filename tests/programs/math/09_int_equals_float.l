# An integer equals the same number written with a decimal point.
# Expect: rows M = [(1,)]
M(x: 1) :- 1 == 1.0;
