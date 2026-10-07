# Test: Each row's list sorted from the greatest. (from tests/programs/lists4/row_sorted_desc.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
L(k: 5, l: null);
@OrderBy(Q, "k");
Q(k:, v: (combine Array= -y -> y :- y in l)) :- L(k:, l:);
