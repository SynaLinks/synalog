# The average; the null skipped.
# Expect: rows Q = [(-0.09285714285714286,)]
X(k: 1, x: 7);
X(k: 2, x: -7);
X(k: 3, x: 2.5);
X(k: 4, x: -2.5);
X(k: 5, x: 0);
X(k: 6, x: null);
X(k: 7, x: 0.1);
X(k: 8, x: -0.75);
Q(a? Avg= x) distinct :- X(x:);
