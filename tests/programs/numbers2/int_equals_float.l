# 3 equals 3.0.
# Expect: rows Q = [(3,)]
N(x: -7);
N(x: -2);
N(x: 0);
N(x: 3);
N(x: 12);
N(x: 1099511627776);
Q(x:) :- N(x:), x == 3.0;
