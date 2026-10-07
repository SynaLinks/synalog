# Each list followed by [0].
# Expect: rows Q = [(1, 4), (2, 1), (3, 2), (4, 5)]
L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
@OrderBy(Q, "id", "n");
Q(id:, n: Size(ArrayConcat(l, [0]))) :- L(id:, l:);
