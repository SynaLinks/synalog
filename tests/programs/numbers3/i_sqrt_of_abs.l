# The square root of the absolute value.
# Expect: rows Q = [(1, 4.123105625617661), (2, 4.123105625617661), (3, 2.0), (4, 0.0), (5, None), (6, 54772.25575051661), (7, 1.0), (8, 3.0)]
X(k: 1, x: 17);
X(k: 2, x: -17);
X(k: 3, x: 4);
X(k: 4, x: 0);
X(k: 5, x: null);
X(k: 6, x: 3000000000);
X(k: 7, x: -1);
X(k: 8, x: 9);
@OrderBy(Q, "k");
Q(k:, v: Sqrt(Abs(x))) :- X(k:, x:);
