# The least, a null made 0 first.
# Expect: rows Q = [(1, 1), (2, -17), (3, 1), (4, 0), (5, 0), (6, 1), (7, -1), (8, 1)]
X(k: 1, x: 17);
X(k: 2, x: -17);
X(k: 3, x: 4);
X(k: 4, x: 0);
X(k: 5, x: null);
X(k: 6, x: 3000000000);
X(k: 7, x: -1);
X(k: 8, x: 9);
@OrderBy(Q, "k");
Q(k:, v: Least(Coalesce(x, 0), 1)) :- X(k:, x:);
