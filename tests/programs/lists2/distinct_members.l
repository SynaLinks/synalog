# The distinct members.
# Expect: rows Q = [(1,), (2,), (3,), (5,), (7,), (8,), (9,)]
L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
@OrderBy(Q, "x");
Q(x:) distinct :- L(l:), x in l;
