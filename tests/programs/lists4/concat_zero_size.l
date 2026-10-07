# The size of each list joined with [0].
# Expect: rows Q = [(1, 4), (2, 1), (3, 2), (4, 5)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, n: Size(ArrayConcat(l, [0]))) :- L(k:, l:);
