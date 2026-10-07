# The size of each list.
# Expect: rows Q = [(1, 3), (2, 0), (3, 1), (4, 4)]
L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
@OrderBy(Q, "id", "n");
Q(id:, n: Size(l)) :- L(id:, l:);
