# A number between 10^15 and 10^18 with a fraction rounds to 15 significant digits.
# Expect: rows Q = [(0, '1500000000000000'), (1, '4503599627370500')]
V(k: 0, x: 1500000000000000.5);
V(k: 1, x: 4503599627370495.5);
@OrderBy(Q, "k");
Q(k:, t: ToString(x)) :- V(k:, x:);
