# Every node with an outgoing edge reaches a sink: ∀ ∃ nested.
# Expect: holds Edge.reaches_sink
@Assert(Edge, reaches_sink: "∀ x y, Edge x y → ∃ s, Reach x s ∧ Sink s");
Edge(x: "a", y: "b");
Edge(x: "b", y: "c");
Sink(n: "c");
@Recursive(Reach, 10);
Reach(x:, y:) distinct :- Edge(x:, y:);
Reach(x:, y: z) distinct :- Reach(x:, y:), Edge(x: y, y: z);
