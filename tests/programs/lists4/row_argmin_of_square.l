# The element of each row whose square less 20 is least.
# Expect: rows Q = [(1, 3), (2, None), (3, 7), (4, 5), (5, None)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
L(k: 5, l: null);
@OrderBy(Q, "k");
Q(k:, v: (combine ArgMin= y -> Abs(y * y - 20) :- y in l)) :- L(k:, l:);
