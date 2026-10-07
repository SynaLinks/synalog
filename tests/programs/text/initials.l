# Initials, in capitals.
# Expect: rows I = [(1, 'AL'), (2, 'AT'), (3, 'GH'), (4, 'ED'), (5, 'BL'), (6, 'KT')]
Customer(id: 1, first: "Ada", last: "Lovelace", email: "ada@analytical.org");
Customer(id: 2, first: "alan", last: "TURING", email: "alan@bletchley.uk");
Customer(id: 3, first: "Grace", last: "Hopper", email: "grace@navy.mil");
Customer(id: 4, first: "Edsger", last: "Dijkstra", email: "ewd@utexas.edu");
Customer(id: 5, first: "Barbara", last: "Liskov", email: "liskov@mit.edu");
Customer(id: 6, first: "Ken", last: "Thompson", email: "ken@bell-labs.com");
@OrderBy(I, "id", "initials");
I(id:, initials: Upper(Substr(first, 1, 1) ++ Substr(last, 1, 1))) :- Customer(id:, first:, last:);
