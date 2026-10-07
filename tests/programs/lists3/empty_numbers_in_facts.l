# An empty list among lists of numbers.
# Expect: rows Q = [(1, 2), (2, 0), (3, 1)]
F(k: 1, l: [3, 4]);
F(k: 2, l: []);
F(k: 3, l: [5]);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- F(k:, l:);
