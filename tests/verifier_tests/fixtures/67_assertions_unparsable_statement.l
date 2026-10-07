# Verifier Test: A statement that does not parse.
# Expected Error: AssertionError.invalidAssertion
#
# (from tests/programs/assertions/29_unparsable_statement.l)

@Assert(Order, broken: "∀ x, Order x →");
Order(order_id: 1, amount: 10);
