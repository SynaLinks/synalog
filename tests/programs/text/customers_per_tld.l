# Customers per top-level domain.
# Expect: rows T = [('com', 1), ('edu', 2), ('mil', 1), ('org', 1), ('uk', 1)]
Customer(id: 1, first: "Ada", last: "Lovelace", email: "ada@analytical.org");
Customer(id: 2, first: "alan", last: "TURING", email: "alan@bletchley.uk");
Customer(id: 3, first: "Grace", last: "Hopper", email: "grace@navy.mil");
Customer(id: 4, first: "Edsger", last: "Dijkstra", email: "ewd@utexas.edu");
Customer(id: 5, first: "Barbara", last: "Liskov", email: "liskov@mit.edu");
Customer(id: 6, first: "Ken", last: "Thompson", email: "ken@bell-labs.com");
Tld(id:, tld: Element(parts, Size(parts) - 1)) :- Customer(id:, email:), parts == Split(email, ".");
@OrderBy(T, "tld", "n");
T(tld:, n? += 1) distinct :- Tld(tld:);
