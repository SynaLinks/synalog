# Lists containing 7.
# Expect: rows Q = [(4,)]
L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
Q(id:) distinct :- L(id:, l:), 7 in l;
