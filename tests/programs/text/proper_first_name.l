# First names with one capital.
# Expect: rows P = [(1, 'Ada'), (2, 'Alan'), (3, 'Grace'), (4, 'Edsger'), (5, 'Barbara'), (6, 'Ken')]
Customer(id: 1, first: "Ada", last: "Lovelace", email: "ada@analytical.org");
Customer(id: 2, first: "alan", last: "TURING", email: "alan@bletchley.uk");
Customer(id: 3, first: "Grace", last: "Hopper", email: "grace@navy.mil");
Customer(id: 4, first: "Edsger", last: "Dijkstra", email: "ewd@utexas.edu");
Customer(id: 5, first: "Barbara", last: "Liskov", email: "liskov@mit.edu");
Customer(id: 6, first: "Ken", last: "Thompson", email: "ken@bell-labs.com");
@OrderBy(P, "id", "first");
P(id:, first: Upper(Substr(f, 1, 1)) ++ Lower(Substr(f, 2, Length(f) - 1))) :- Customer(id:, first: f);
