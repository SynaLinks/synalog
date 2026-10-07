# Test: A null passed through two predicates, typed by a text in another rule. (from tests/programs/typing/null_through_two_predicates_text.l)

A(k: 1, v: null);
B(k:, v:) :- A(k:, v:);
B(k: 2, v: "x");
@OrderBy(Q, "k");
Q(k:, v:) :- B(k:, v:);
