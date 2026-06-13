# Test: Multiple aggregations in one rule

Sales(region: "North", product: "A", amount: 100);
Sales(region: "North", product: "B", amount: 150);
Sales(region: "South", product: "A", amount: 200);
Sales(region: "South", product: "B", amount: 75);
Sales(region: "East", product: "A", amount: 300);

# Multiple aggregations grouped by region
@OrderBy(RegionStats, "region");
RegionStats(region:,
            total? += amount,
            count? += 1,
            max_sale? Max= amount,
            min_sale? Min= amount) distinct :- Sales(region:, product:, amount:);

@OrderBy(Test, "region");
Test(region:, total:, count:, max_sale:, min_sale:) :- RegionStats(region:, total:, count:, max_sale:, min_sale:);
