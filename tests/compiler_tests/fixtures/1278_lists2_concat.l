# Test: Each list followed by [0]. (from tests/programs/lists2/concat.l)

L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
@OrderBy(Q, "id", "n");
Q(id:, n: Size(ArrayConcat(l, [0]))) :- L(id:, l:);
