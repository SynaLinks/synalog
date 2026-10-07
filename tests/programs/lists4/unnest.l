# Every element with its list; the empty list gives none.
# Expect: rows Q = [(1, 1), (1, 2), (1, 3), (3, 7), (4, 1), (4, 5), (4, 5), (4, 9)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k", "x");
Q(k:, x:) :- L(k:, l:), x in l;
