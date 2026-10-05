# Pairs of distinct numbers below 4.
# Expect: rows Q = [(0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3)]
@OrderBy(Q, "a", "b");
Q(a:, b:) :- a in Range(4), b in Range(4), a < b;
