# Two applications side by side.
# Expect: rows Q = [(89, 25)]
Ship(id: 1, client: "acme", src: "paris", dst: "lyon", kg: 12, carrier: "dhl");
Ship(id: 2, client: "acme", src: "lyon", dst: "nice", kg: 5, carrier: "ups");
Ship(id: 3, client: "bolt", src: "paris", dst: "nice", kg: 30, carrier: "dhl");
Ship(id: 4, client: "bolt", src: "nice", dst: "rome", kg: 8, carrier: "fedex");
Ship(id: 5, client: "cora", src: "rome", dst: "milan", kg: 14, carrier: "ups");
Ship(id: 6, client: "cora", src: "milan", dst: "paris", kg: 3, carrier: "dhl");
Ship(id: 7, client: "acme", src: "paris", dst: "rome", kg: 22, carrier: "fedex");
Ship(id: 8, client: "dune", src: "lyon", dst: "paris", kg: 9, carrier: "ups");
Ship(id: 9, client: "dune", src: "nice", dst: "lyon", kg: 11, carrier: "dhl");
Src(kg: 0);
Total(t? += kg) distinct :- Src(kg:);
Heavy(kg:) :- Ship(kg:), kg > 10;
Light(kg:) :- Ship(kg:), kg <= 10;
H := Total(Src: Heavy);
L := Total(Src: Light);
Q(h:, l:) :- H(t: h), L(t: l);
