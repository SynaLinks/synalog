# The sum per sign.
# Expect: rows Q = [(-1, -18), (0, 0), (1, 3000000030)]
X(k: 1, x: 17);
X(k: 2, x: -17);
X(k: 3, x: 4);
X(k: 4, x: 0);
X(k: 5, x: null);
X(k: 6, x: 3000000000);
X(k: 7, x: -1);
X(k: 8, x: 9);
@OrderBy(Q, "s");
Q(s: (if x > 0 then 1 else if x < 0 then -1 else 0), t? += x) distinct :- X(x:);
