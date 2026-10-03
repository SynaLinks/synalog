# Verifier Test: A raw table name is not a predicate: it reads as a variable.
# Expected Error: AssertionError.invalidAssertion
#
# (from tests/programs/assertions/66_lowercase_predicate_is_a_variable.l)

@Assert(Order, raw: "∀ o, orders o → Order o");
Order(order_id: 1, amount: 3);
