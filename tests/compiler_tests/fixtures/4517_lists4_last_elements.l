# Test: The last element of each list, null for the empty one. (from tests/programs/lists4/last_elements.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, v: Element(l, Size(l) - 1)) :- L(k:, l:);
