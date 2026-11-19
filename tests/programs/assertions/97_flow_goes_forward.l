# Funds flow only to later transactions, through any number of hops.
# Expect: holds Flow.forward

@Assert(Flow, forward: "∀ x y, Flow x y → x < y");
Link(from_tx: 1, to_tx: 2);
Link(from_tx: 2, to_tx: 3);
Link(from_tx: 3, to_tx: 4);
@Recursive(Flow, 10);
Flow(from_tx:, to_tx:) :- Link(from_tx:, to_tx:);
Flow(from_tx:, to_tx:) :- Flow(from_tx:, to_tx: mid), Link(from_tx: mid, to_tx:);
