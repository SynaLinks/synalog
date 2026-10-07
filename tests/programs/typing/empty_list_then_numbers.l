# An empty list and a list of numbers in one column.
# Expect: rows Q = [(1, 0), (2, 2)]
V(k: 1, l: []);
V(k: 2, l: [1, 2]);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- V(k:, l:);
