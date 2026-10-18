# An assertion written before its predicate waits for it, and for what it
# names: no warning until the predicate exists.
# Expect: valid
# Expect: status Order.known pending
# Expect: quiet

@Assert(Order, known: "∀ o c, Order o c → Costumer c");
Customer(id: 1);
