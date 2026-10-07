# Test: A record built from a table's number column keeps the number. (from tests/programs/rtypes/number_field_from_a_table.l)

P(name: "a", score: 100);
P(name: "b", score: 20);
R(r: {name:, score:}) :- P(name:, score:);
@OrderBy(Q, "score");
Q(name: r.name, score: r.score) :- R(r:);
