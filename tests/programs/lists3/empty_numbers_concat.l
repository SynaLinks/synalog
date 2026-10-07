# Each list with a list of numbers.
# Expect: rows Q = [(1, 3), (2, 1), (3, 2)]
F(k: 1, l: [3, 4]);
F(k: 2, l: []);
F(k: 3, l: [5]);
@OrderBy(Q, "k");
Q(k:, n: Size(ArrayConcat(l, [9]))) :- F(k:, l:);
