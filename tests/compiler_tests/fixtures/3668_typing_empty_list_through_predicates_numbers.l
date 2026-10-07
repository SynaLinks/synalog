# Test: An empty list passed on, typed by a list of numbers elsewhere. (from tests/programs/typing/empty_list_through_predicates_numbers.l)

A(k: 1, l: []);
B(k:, l:) :- A(k:, l:);
B(k: 2, l: [1, 2]);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- B(k:, l:);
