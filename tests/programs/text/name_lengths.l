# Letters in each name.
# Expect: rows L = [(1, 11), (2, 10), (3, 11), (4, 14), (5, 13), (6, 11)]
Customer(id: 1, first: "Ada", last: "Lovelace", email: "ada@analytical.org");
Customer(id: 2, first: "alan", last: "TURING", email: "alan@bletchley.uk");
Customer(id: 3, first: "Grace", last: "Hopper", email: "grace@navy.mil");
Customer(id: 4, first: "Edsger", last: "Dijkstra", email: "ewd@utexas.edu");
Customer(id: 5, first: "Barbara", last: "Liskov", email: "liskov@mit.edu");
Customer(id: 6, first: "Ken", last: "Thompson", email: "ken@bell-labs.com");
@OrderBy(L, "id", "n");
L(id:, n: Length(first) + Length(last)) :- Customer(id:, first:, last:);
