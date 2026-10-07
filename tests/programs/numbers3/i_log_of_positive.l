# The natural logarithm of the positive values.
# Expect: rows Q = [(1, 2.833213344056216), (3, 1.3862943611198906), (6, 21.82187812561452), (8, 2.1972245773362196)]
X(k: 1, x: 17);
X(k: 2, x: -17);
X(k: 3, x: 4);
X(k: 4, x: 0);
X(k: 5, x: null);
X(k: 6, x: 3000000000);
X(k: 7, x: -1);
X(k: 8, x: 9);
@OrderBy(Q, "k");
Q(k:, v: Log(x)) :- X(k:, x:), x > 0;
