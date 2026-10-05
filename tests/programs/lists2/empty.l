# Empty lists.
# Expect: rows Q = [(2,)]
L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
Q(id:) :- L(id:, l:), Size(l) == 0;
