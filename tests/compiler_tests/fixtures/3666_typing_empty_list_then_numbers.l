# Test: An empty list and a list of numbers in one column. (from tests/programs/typing/empty_list_then_numbers.l)

V(k: 1, l: []);
V(k: 2, l: [1, 2]);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- V(k:, l:);
