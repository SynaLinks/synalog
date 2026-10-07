# The positions of each list's elements.
# Expect: rows Q = [(1, 0), (1, 1), (1, 2), (3, 0), (4, 0), (4, 1), (4, 2), (4, 3)]
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k", "i");
Q(k:, i:) :- L(k:, l:), i in Range(Size(l));
