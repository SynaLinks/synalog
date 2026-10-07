# Test: The sum of list 4, null when empty. (from tests/programs/lists4/sum_of_list_4.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
Q(s? += x) distinct :- L(k: 4, l:), x in l;
