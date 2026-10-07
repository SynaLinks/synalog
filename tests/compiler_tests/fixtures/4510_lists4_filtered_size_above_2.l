# Test: How many elements of each list are above 2, 0 when none. (from tests/programs/lists4/filtered_size_above_2.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, n: Coalesce((combine += 1 :- y in l, y > 2), 0)) :- L(k:, l:);
