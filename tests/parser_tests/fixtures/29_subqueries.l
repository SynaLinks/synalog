# Test: Subqueries and nested predicates
@Engine("duckdb");

Sales(product: "A", amount: 100);
Sales(product: "A", amount: 150);
Sales(product: "B", amount: 200);
Sales(product: "C", amount: 50);

# Subquery in condition
AvgSale() += amount :- Sales(product:, amount:);
CountSales() += 1 :- Sales(product:, amount:);
GlobalAvg() = AvgSale() / CountSales();

AboveAverage(product:, amount:) :- Sales(product:, amount:), amount > GlobalAvg();

# Nested aggregation
TotalByProduct(product:, total? += amount) distinct :- Sales(product:, amount:);
MaxTotal() Max= total :- TotalByProduct(product:, total:);
TopProduct(product:) :- TotalByProduct(product:, total:), total == MaxTotal();

@OrderBy(Test, "product");
Test(product:, amount:) :- AboveAverage(product:, amount:);
