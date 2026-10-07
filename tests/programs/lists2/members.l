# Every member of every list.
# Expect: rows Q = [(1, 1), (1, 2), (1, 3), (3, 5), (4, 7), (4, 7), (4, 8), (4, 9)]
L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
@OrderBy(Q, "id", "x");
Q(id:, x:) :- L(id:, l:), x in l;
