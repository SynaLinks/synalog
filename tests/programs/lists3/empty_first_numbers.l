# The empty list first among lists of numbers.
# Expect: rows Q = [(1, 0), (2, 2)]
F(k: 1, l: []);
F(k: 2, l: [1, 2]);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- F(k:, l:);
