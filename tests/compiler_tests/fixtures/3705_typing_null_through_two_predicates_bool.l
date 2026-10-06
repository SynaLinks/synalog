# Test: A null passed through two predicates, typed by a bool in another rule. (from tests/programs/typing/null_through_two_predicates_bool.l)

A(k: 1, v: null);
B(k:, v:) :- A(k:, v:);
B(k: 2, v: true);
@OrderBy(Q, "k");
Q(k:, v:) :- B(k:, v:);
