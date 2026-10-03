# ≠ between two columns.
# Expect: counterexamples Edge.no_loop = [(2, 2)]
@Assert(Edge, no_loop: "∀ x y, Edge x y → x ≠ y");
Edge(x: 1, y: 2);
Edge(x: 2, y: 2);
