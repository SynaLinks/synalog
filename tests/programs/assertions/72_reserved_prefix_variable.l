# A statement variable named x_1, which Synalog reserves in rules.
# Expect: counterexamples Edge.no_loop = [(2, 2)]
@Assert(Edge, no_loop: "∀ x_1 y, Edge x_1 y → x_1 ≠ y");
Edge(x: 1, y: 2);
Edge(x: 2, y: 2);
