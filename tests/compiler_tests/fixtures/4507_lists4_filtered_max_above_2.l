# Test: The greatest element of each list above 2, null when none. (from tests/programs/lists4/filtered_max_above_2.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, m: (combine Max= y :- y in l, y > 2)) :- L(k:, l:);
