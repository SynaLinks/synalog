# Test: Written before Refund exists: it waits. (from tests/programs/assertions/26_pending_before_its_predicate.l)

@Assert(Refund, bounded: "∀ o, Refund o ≤ 100");
Order(order_id: 1, amount: 10);
