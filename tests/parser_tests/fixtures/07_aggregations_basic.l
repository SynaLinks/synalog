# Test: Basic aggregations
@Engine("duckdb");

Sales(product: "A", amount: 100);
Sales(product: "A", amount: 150);
Sales(product: "B", amount: 200);
Sales(product: "B", amount: 50);
Sales(product: "C", amount: 300);

# Sum aggregation
TotalByProduct(product:, total? += amount) distinct :- Sales(product:, amount:);

# Count aggregation
CountByProduct(product:, count? += 1) distinct :- Sales(product:, amount:);

# Min aggregation
MinByProduct(product:, min_amount? Min= amount) distinct :- Sales(product:, amount:);

# Max aggregation
MaxByProduct(product:, max_amount? Max= amount) distinct :- Sales(product:, amount:);

# Global aggregations
GrandTotal() += amount :- Sales(product:, amount:);
TotalCount() += 1 :- Sales(product:, amount:);

@OrderBy(Test, "product");
Test(product:, total:, count:, min_amount:, max_amount:) :-
  TotalByProduct(product:, total:),
  CountByProduct(product:, count:),
  MinByProduct(product:, min_amount:),
  MaxByProduct(product:, max_amount:);
