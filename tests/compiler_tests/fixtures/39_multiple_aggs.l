# Test: Multiple aggregations in same rule

# Data
Transactions("Alice", "purchase", 100);
Transactions("Alice", "purchase", 50);
Transactions("Alice", "refund", 30);
Transactions("Bob", "purchase", 200);
Transactions("Bob", "purchase", 75);
Transactions("Charlie", "purchase", 150);
Transactions("Charlie", "refund", 50);
Transactions("Charlie", "purchase", 100);

# Multiple aggregations on same grouping
CustomerStats(
  customer,
  total? += amount,
  count? += 1,
  max_txn? Max= amount,
  min_txn? Min= amount,
  avg_txn? Avg= amount
) distinct :- Transactions(customer, type, amount);

# Aggregations with filter
PurchaseStats(
  customer,
  purchase_total? += amount,
  purchase_count? += 1
) distinct :-
  Transactions(customer, "purchase", amount);

# Combined stats
FullStats(customer, total, purchase_total) :-
  CustomerStats(customer, total:, count:, max_txn: max_t, min_txn: min_t, avg_txn: avg_t),
  PurchaseStats(customer, purchase_total:, purchase_count: pcount);

@OrderBy(Test, "customer");
Test(customer:, total:, count:, max_txn:) :-
  CustomerStats(customer, total:, count:, max_txn:);
