# Test: List 4 collected in reverse order. (from tests/programs/lists4/reversed_list_4.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
Q(s? Array= -x -> x) distinct :- L(k: 4, l:), x in l;
