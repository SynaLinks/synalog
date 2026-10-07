# The greatest element of each list above 1, null when none.
# Expect: rows Q = [(1, 3), (2, None), (3, 7), (4, 9)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, m: (combine Max= y :- y in l, y > 1)) :- L(k:, l:);
