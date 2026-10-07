# Test: The size of each list joined with []. (from tests/programs/lists4/concat_empty_size.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, n: Size(ArrayConcat(l, []))) :- L(k:, l:);
