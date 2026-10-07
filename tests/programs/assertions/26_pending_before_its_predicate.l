# Written before Refund exists: it waits.
# Expect: status Refund.bounded pending
# Expect: valid

@Assert(Refund, bounded: "∀ o, Refund o ≤ 100");
Order(order_id: 1, amount: 10);
