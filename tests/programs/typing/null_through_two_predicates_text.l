# A null passed through two predicates, typed by a text in another rule.
# Expect: rows Q = [(1, None), (2, 'x')]
A(k: 1, v: null);
B(k:, v:) :- A(k:, v:);
B(k: 2, v: "x");
@OrderBy(Q, "k");
Q(k:, v:) :- B(k:, v:);
