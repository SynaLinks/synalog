# An empty list passed on, typed by a list of texts elsewhere.
# Expect: rows Q = [(1, 0), (2, 2)]
A(k: 1, l: []);
B(k:, l:) :- A(k:, l:);
B(k: 2, l: ["a", "b"]);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- B(k:, l:);
