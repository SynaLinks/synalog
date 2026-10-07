# The part of each email before the at sign.
# Expect: rows L = [(1, 'ada'), (2, 'alan'), (3, 'grace'), (4, 'ewd'), (5, 'liskov'), (6, 'ken')]
Customer(id: 1, first: "Ada", last: "Lovelace", email: "ada@analytical.org");
Customer(id: 2, first: "alan", last: "TURING", email: "alan@bletchley.uk");
Customer(id: 3, first: "Grace", last: "Hopper", email: "grace@navy.mil");
Customer(id: 4, first: "Edsger", last: "Dijkstra", email: "ewd@utexas.edu");
Customer(id: 5, first: "Barbara", last: "Liskov", email: "liskov@mit.edu");
Customer(id: 6, first: "Ken", last: "Thompson", email: "ken@bell-labs.com");
@OrderBy(L, "id", "local");
L(id:, local: Element(Split(email, "@"), 0)) :- Customer(id:, email:);
