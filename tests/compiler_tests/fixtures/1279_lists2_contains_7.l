# Test: Lists containing 7. (from tests/programs/lists2/contains_7.l)

L(id: 1, l: [3, 1, 2]);
L(id: 2, l: []);
L(id: 3, l: [5]);
L(id: 4, l: [7, 7, 8, 9]);
Q(id:) distinct :- L(id:, l:), 7 in l;
