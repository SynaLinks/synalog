# The last element of each list, null for the empty one.
# Expect: rows Q = [(1, 3), (2, None), (3, 7), (4, 1)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, v: Element(l, Size(l) - 1)) :- L(k:, l:);
