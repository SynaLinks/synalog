# The natural logarithm of the positive values.
# Expect: rows Q = [(1, 1.9459101490553132), (3, 0.9162907318741551), (7, -2.3025850929940455)]
X(k: 1, x: 7);
X(k: 2, x: -7);
X(k: 3, x: 2.5);
X(k: 4, x: -2.5);
X(k: 5, x: 0);
X(k: 6, x: null);
X(k: 7, x: 0.1);
X(k: 8, x: -0.75);
@OrderBy(Q, "k");
Q(k:, v: Log(x)) :- X(k:, x:), x > 0;
