# A record passed through two predicates, read at the end.
# Expect: rows Q = [(1, "a", 1, 1.5), (2, "b", 0, None)]
P(id: 1, r: {name: "a", tags: ["x"], score: 1.5});
P(id: 2, r: {name: "b", tags: [], score: null});
A(id:, r:) :- P(id:, r:);
B(id:, r:) :- A(id:, r:);
@OrderBy(Q, "id");
Q(id:, name: r.name, n: Size(r.tags), s: r.score) :- B(id:, r:);
