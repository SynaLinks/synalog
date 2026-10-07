# Test: += of each row's list elements above 0; null (0 for a distinct count) when none, a null list too. (from tests/programs/lists4/row_count_above_0.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
L(k: 5, l: null);
@OrderBy(Q, "k");
Q(k:, v: (combine += 1 :- y in l, y > 0)) :- L(k:, l:);
