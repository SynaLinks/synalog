# Test: Elements of the lists of a row's elements: each element y gives Range(y). (from tests/programs/lists4/row_nested_lists.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
L(k: 5, l: null);
@OrderBy(Q, "k");
Q(k:, v: (combine += z :- y in l, z in Range(y))) :- L(k:, l:);
