# Node d's only edge leads nowhere a sink is.
# Expect: counterexamples Edge.reaches_sink = [("d", "e")]
@Assert(Edge, reaches_sink: "∀ x y, Edge x y → ∃ s, Reach x s ∧ Sink s");
Edge(x: "a", y: "b");
Edge(x: "b", y: "c");
Edge(x: "d", y: "e");
Sink(n: "c");
@Recursive(Reach, 10);
Reach(x:, y:) distinct :- Edge(x:, y:);
Reach(x:, y: z) distinct :- Reach(x:, y:), Edge(x: y, y: z);
