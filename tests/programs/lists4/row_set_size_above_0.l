# Set= of each row's list elements above 0; null (0 for a distinct count) when none, a null list too.
# Expect: rows Q = [(1, 3), (2, None), (3, 1), (4, 3), (5, None)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
L(k: 5, l: null);
@OrderBy(Q, "k");
Q(k:, v: Size((combine Set= y :- y in l, y > 0))) :- L(k:, l:);
