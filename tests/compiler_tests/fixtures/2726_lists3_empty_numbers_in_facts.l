# Test: An empty list among lists of numbers. (from tests/programs/lists3/empty_numbers_in_facts.l)

F(k: 1, l: [3, 4]);
F(k: 2, l: []);
F(k: 3, l: [5]);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- F(k:, l:);
