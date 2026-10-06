# A null passed through two predicates, typed by a bool in another rule.
# Expect: rows Q = [(1, None), (2, True)]
A(k: 1, v: null);
B(k:, v:) :- A(k:, v:);
B(k: 2, v: true);
@OrderBy(Q, "k");
Q(k:, v:) :- B(k:, v:);
