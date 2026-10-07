# Test: The lists holding 5; none of them the empty one. (from tests/programs/lists4/lists_holding_5.l)

L(k: 1, l: [1, 2, 3]);
L(k: 2, l: []);
L(k: 3, l: [7]);
L(k: 4, l: [5, 5, 9, 1]);
@OrderBy(Q, "k");
Q(k:) :- L(k:, l:), 5 in l;
