# A label per customer.
# Expect: rows L = [(1, '#1: Lovelace'), (2, '#2: TURING'), (3, '#3: Hopper'), (4, '#4: Dijkstra'), (5, '#5: Liskov'), (6, '#6: Thompson')]
Customer(id: 1, first: "Ada", last: "Lovelace", email: "ada@analytical.org");
Customer(id: 2, first: "alan", last: "TURING", email: "alan@bletchley.uk");
Customer(id: 3, first: "Grace", last: "Hopper", email: "grace@navy.mil");
Customer(id: 4, first: "Edsger", last: "Dijkstra", email: "ewd@utexas.edu");
Customer(id: 5, first: "Barbara", last: "Liskov", email: "liskov@mit.edu");
Customer(id: 6, first: "Ken", last: "Thompson", email: "ken@bell-labs.com");
@OrderBy(L, "id", "label");
L(id:, label: "#" ++ ToString(id) ++ ": " ++ last) :- Customer(id:, last:);
