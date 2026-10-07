# Numbers exactly half way at the last digit kept: half away from zero.
# Expect: rows Q = [(0, '12345678901234.3'), (1, '1234567890123.13'), (2, '-12345678901234.3'), (3, '100000000000001')]
V(k: 0, x: 12345678901234.25);
V(k: 1, x: 1234567890123.125);
V(k: 2, x: -12345678901234.25);
V(k: 3, x: 100000000000000.5);
@OrderBy(Q, "k");
Q(k:, t: ToString(x)) :- V(k:, x:);
