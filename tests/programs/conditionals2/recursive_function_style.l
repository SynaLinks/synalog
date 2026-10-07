# A conditional choosing between two functions.
# Expect: rows Q = [(1, 4), (2, 9), (3, 6)]
Sq(x) = x * x;
Dbl(x) = x * 2;
W(k: 1, x: 2);
W(k: 2, x: 3);
W(k: 3, x: 3);
@OrderBy(Q, "k");
Q(k:, v: (if k == 3 then Dbl(x) else Sq(x))) :- W(k:, x:);
