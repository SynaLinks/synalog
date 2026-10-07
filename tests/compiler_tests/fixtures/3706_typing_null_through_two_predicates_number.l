# Test: A null passed through two predicates, typed by a number in another rule. (from tests/programs/typing/null_through_two_predicates_number.l)

A(k: 1, v: null);
B(k:, v:) :- A(k:, v:);
B(k: 2, v: 5);
@OrderBy(Q, "k");
Q(k:, v:) :- B(k:, v:);
