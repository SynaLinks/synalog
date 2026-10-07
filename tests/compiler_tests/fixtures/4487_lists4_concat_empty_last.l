# Test: The last element of each list joined with []. (from tests/programs/lists4/concat_empty_last.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, v: Element(ArrayConcat(l, []), Size(ArrayConcat(l, [])) - 1)) :- L(k:, l:);
