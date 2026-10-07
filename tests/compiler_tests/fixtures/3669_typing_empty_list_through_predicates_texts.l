# Test: An empty list passed on, typed by a list of texts elsewhere. (from tests/programs/typing/empty_list_through_predicates_texts.l)

A(k: 1, l: []);
B(k:, l:) :- A(k:, l:);
B(k: 2, l: ["a", "b"]);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- B(k:, l:);
