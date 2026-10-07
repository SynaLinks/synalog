# Test: How many elements each list has, by unnesting; the empty list has no row. (from tests/programs/lists4/count_elements.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:, n? += 1) distinct :- L(k:, l:), x in l;
