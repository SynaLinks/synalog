# Each row's list sorted from the greatest.
# Expect: rows Q = [(1, [3, 2, 1]), (2, None), (3, [7]), (4, [9, 5, 5, 1]), (5, None)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
L(k: 5, l: null);
@OrderBy(Q, "k");
Q(k:, v: (combine Array= -y -> y :- y in l)) :- L(k:, l:);
