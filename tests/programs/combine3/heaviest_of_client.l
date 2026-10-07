# The heaviest shipment of each client.
# Expect: rows Q = [(3,), (5,), (7,), (9,)]
Ship(id: 1, client: "acme", src: "paris", dst: "lyon", kg: 12, carrier: "dhl");
Ship(id: 2, client: "acme", src: "lyon", dst: "nice", kg: 5, carrier: "ups");
Ship(id: 3, client: "bolt", src: "paris", dst: "nice", kg: 30, carrier: "dhl");
Ship(id: 4, client: "bolt", src: "nice", dst: "rome", kg: 8, carrier: "fedex");
Ship(id: 5, client: "cora", src: "rome", dst: "milan", kg: 14, carrier: "ups");
Ship(id: 6, client: "cora", src: "milan", dst: "paris", kg: 3, carrier: "dhl");
Ship(id: 7, client: "acme", src: "paris", dst: "rome", kg: 22, carrier: "fedex");
Ship(id: 8, client: "dune", src: "lyon", dst: "paris", kg: 9, carrier: "ups");
Ship(id: 9, client: "dune", src: "nice", dst: "lyon", kg: 11, carrier: "dhl");
@OrderBy(Q, "id");
Q(id:) :- Ship(id:, client:, kg:), kg == (combine Max= w :- Ship(client:, kg: w));
