# Verifier Test: Unsafe aggregation in the head
# Expected Error: SafetyError.unsafeAggregation
#
# Aggregates are usually written in the head. Here the aggregated variable
# 'amount' is bound by nothing in the body, so the total is meaningless.

Customers(customer_id:) :- customer_id in Range(3);

# ERROR: 'amount' is aggregated but never bound
Total(total? += amount) distinct :- Customers(customer_id:);
