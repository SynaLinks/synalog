# Last names over 7 letters break the bound.
# Expect: violated Len.short 3
Customer(id: 1, first: "Ada", last: "Lovelace", email: "ada@analytical.org");
Customer(id: 2, first: "alan", last: "TURING", email: "alan@bletchley.uk");
Customer(id: 3, first: "Grace", last: "Hopper", email: "grace@navy.mil");
Customer(id: 4, first: "Edsger", last: "Dijkstra", email: "ewd@utexas.edu");
Customer(id: 5, first: "Barbara", last: "Liskov", email: "liskov@mit.edu");
Customer(id: 6, first: "Ken", last: "Thompson", email: "ken@bell-labs.com");
Len(id:, n: Length(last)) :- Customer(id:, last:);
@Assert(Len, short: "∀ i, Len i ≤ 7");
