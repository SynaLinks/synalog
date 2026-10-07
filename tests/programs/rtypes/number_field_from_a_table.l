# A record built from a table's number column keeps the number.
# Expect: rows Q = [("b", 20), ("a", 100)]
P(name: "a", score: 100);
P(name: "b", score: 20);
R(r: {name:, score:}) :- P(name:, score:);
@OrderBy(Q, "score");
Q(name: r.name, score: r.score) :- R(r:);
