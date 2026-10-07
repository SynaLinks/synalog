# Test: Unnesting skips the empty list. (from tests/programs/lists3/empty_numbers_summed.l)

F(k: 1, l: [3, 4]);
F(k: 2, l: []);
F(k: 3, l: [5]);
@OrderBy(Q, "k");
Q(k:, t? += x) distinct :- F(k:, l:), x in l;
