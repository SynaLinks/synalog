# Test: Element 1 of each list, from 0; null past the end and below zero. (from tests/programs/lists4/element_1.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, v: Element(l, 1)) :- L(k:, l:);
