# Cities reached from paris on ups routes only.
# Expect: rows Q = []
Ship(id: 1, client: "acme", src: "paris", dst: "lyon", kg: 12, carrier: "dhl");
Ship(id: 2, client: "acme", src: "lyon", dst: "nice", kg: 5, carrier: "ups");
Ship(id: 3, client: "bolt", src: "paris", dst: "nice", kg: 30, carrier: "dhl");
Ship(id: 4, client: "bolt", src: "nice", dst: "rome", kg: 8, carrier: "fedex");
Ship(id: 5, client: "cora", src: "rome", dst: "milan", kg: 14, carrier: "ups");
Ship(id: 6, client: "cora", src: "milan", dst: "paris", kg: 3, carrier: "dhl");
Ship(id: 7, client: "acme", src: "paris", dst: "rome", kg: 22, carrier: "fedex");
Ship(id: 8, client: "dune", src: "lyon", dst: "paris", kg: 9, carrier: "ups");
Ship(id: 9, client: "dune", src: "nice", dst: "lyon", kg: 11, carrier: "dhl");
Edge(a: "x", b: "x");
@Recursive(Reach, 6);
Reach(a:, b:) distinct :- Edge(a:, b:);
Reach(a:, b: c) distinct :- Reach(a:, b:), Edge(a: b, b: c);
Route(a: src, b: dst) :- Ship(src:, dst:, carrier: "ups");
R := Reach(Edge: Route);
Q(b:) :- R(a: "paris", b:);
