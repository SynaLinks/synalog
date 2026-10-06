# A function giving a null or a number.
# Expect: rows Q = [(1, None), (4, 2)]
Half(x) = (if x % 2 == 0 then x / 2 else null);
V(x: 1);
V(x: 4);
@OrderBy(Q, "x");
Q(x:, h: Half(x)) :- V(x:);
