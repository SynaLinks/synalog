# Test: The empty list first among lists of numbers. (from tests/programs/lists3/empty_first_numbers.l)

F(k: 1, l: []);
F(k: 2, l: [1, 2]);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- F(k:, l:);
