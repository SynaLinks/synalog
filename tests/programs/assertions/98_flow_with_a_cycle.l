# A link back from 4 to 2 makes the cycle 2 → 3 → 4 → 2: every flow out
# of 3 or 4, and 2 back to itself, goes backwards.
# Expect: violated Flow.forward 6
# Expect: counterexamples Flow.forward = [(2, 2), (3, 2), (3, 3), (4, 2), (4, 3), (4, 4)]

@Assert(Flow, forward: "∀ x y, Flow x y → x < y");
Link(from_tx: 1, to_tx: 2);
Link(from_tx: 2, to_tx: 3);
Link(from_tx: 3, to_tx: 4);
Link(from_tx: 4, to_tx: 2);
@Recursive(Flow, 10);
Flow(from_tx:, to_tx:) :- Link(from_tx:, to_tx:);
Flow(from_tx:, to_tx:) :- Flow(from_tx:, to_tx: mid), Link(from_tx: mid, to_tx:);
