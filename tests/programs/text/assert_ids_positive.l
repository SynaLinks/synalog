# Customer ids are positive.
# Expect: holds Customer.positive
Customer(id: 1, first: "Ada", last: "Lovelace", email: "ada@analytical.org");
Customer(id: 2, first: "alan", last: "TURING", email: "alan@bletchley.uk");
Customer(id: 3, first: "Grace", last: "Hopper", email: "grace@navy.mil");
Customer(id: 4, first: "Edsger", last: "Dijkstra", email: "ewd@utexas.edu");
Customer(id: 5, first: "Barbara", last: "Liskov", email: "liskov@mit.edu");
Customer(id: 6, first: "Ken", last: "Thompson", email: "ken@bell-labs.com");
@Assert(Customer, positive: "∀ i f l e, Customer i f l e → i > 0");
