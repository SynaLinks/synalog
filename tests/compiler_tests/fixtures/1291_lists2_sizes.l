# Test: The size of each list. (from tests/programs/lists2/sizes.l)

L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
@OrderBy(Q, "id", "n");
Q(id:, n: Size(l)) :- L(id:, l:);
