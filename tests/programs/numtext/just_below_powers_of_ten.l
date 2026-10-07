# Numbers just below a power of ten: their digits are counted, not taken from a logarithm.
# Expect: rows Q = [(0, '999999999999999'), (1, '100000000000000'), (2, '0.1'), (3, '10000')]
V(k: 0, x: 999999999999999.4);
V(k: 1, x: 99999999999999.95);
V(k: 2, x: 0.0999999999999999);
V(k: 3, x: 9999.999999999998);
@OrderBy(Q, "k");
Q(k:, t: ToString(x)) :- V(k:, x:);
