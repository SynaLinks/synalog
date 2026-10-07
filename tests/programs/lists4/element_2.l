# Element 2 of each list, from 0; null past the end and below zero.
# Expect: rows Q = [(1, 3), (2, None), (3, None), (4, 9)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, v: Element(l, 2)) :- L(k:, l:);
