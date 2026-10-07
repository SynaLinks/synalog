# No order is both open and shipped.
# Expect: counterexamples Open.not_shipped = [(2,)]
@Assert(Open, not_shipped: "∀ o, Open o → ¬ ∃ d, Shipped o d");
Open(order_id:) :- order_id in [1, 2];
Shipped(order_id: 2, day: "2026-01-01");
Shipped(order_id: 3, day: "2026-01-02");
