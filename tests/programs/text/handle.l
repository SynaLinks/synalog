# A lowercase handle.
# Expect: rows H = [(1, 'ada.lovelace'), (2, 'alan.turing'), (3, 'grace.hopper'), (4, 'edsger.dijkstra'), (5, 'barbara.liskov'), (6, 'ken.thompson')]
Customer(id: 1, first: "Ada", last: "Lovelace", email: "ada@analytical.org");
Customer(id: 2, first: "alan", last: "TURING", email: "alan@bletchley.uk");
Customer(id: 3, first: "Grace", last: "Hopper", email: "grace@navy.mil");
Customer(id: 4, first: "Edsger", last: "Dijkstra", email: "ewd@utexas.edu");
Customer(id: 5, first: "Barbara", last: "Liskov", email: "liskov@mit.edu");
Customer(id: 6, first: "Ken", last: "Thompson", email: "ken@bell-labs.com");
@OrderBy(H, "id", "handle");
H(id:, handle: Lower(first) ++ "." ++ Lower(last)) :- Customer(id:, first:, last:);
