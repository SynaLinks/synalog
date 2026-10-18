# An assertion about a predicate that exists, naming one nothing defines:
# a misspelled name (or a missing import) would leave it pending forever.
# Expect: valid
# Expect: status Order.known pending
# Expect: warning Assertion 'Order.known' names Costumer, which nothing defines or imports

Customer(id: 1);
@Assert(Order, known: "∀ o c, Order o c → Costumer c");
@OrderBy(Order, "id");
Order(id: 1, customer: 1);
