# An integer equals the same fraction.
# Expect: rows N = [(2,)]
V(x:) :- x in [1, 2];
N(x:) :- V(x:), x == 2.0;
