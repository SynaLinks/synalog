# Its predicate exists: it can be checked.
# Expect: status Refund.bounded unchecked
# Expect: holds Refund.bounded

@Assert(Refund, bounded: "∀ o, Refund o ≤ 100");
Refund(order_id: 1, amount: 10);
