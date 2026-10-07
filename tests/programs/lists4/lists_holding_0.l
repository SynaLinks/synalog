# The lists holding 0; none of them the empty one.
# Expect: rows Q = []
L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:) distinct :- L(k:, l:), 0 in l;
