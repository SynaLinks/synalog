# The values above -5.
# Expect: rows Q = [(1,), (3,), (4,), (5,), (7,), (8,)]
X(k: 1, x: 7);
X(k: 2, x: -7);
X(k: 3, x: 2.5);
X(k: 4, x: -2.5);
X(k: 5, x: 0);
X(k: 6, x: null);
X(k: 7, x: 0.1);
X(k: 8, x: -0.75);
@OrderBy(Q, "k");
Q(k:) :- X(k:, x:), x > -5;
