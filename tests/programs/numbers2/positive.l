# Positive numbers.
# Expect: rows Q = [(3,), (12,), (1099511627776,)]
N(x: -7);
N(x: -2);
N(x: 0);
N(x: 3);
N(x: 12);
N(x: 1099511627776);
@OrderBy(Q, "x");
Q(x:) :- N(x:), x > 0;
