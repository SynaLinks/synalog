# Test: Grouped aggregations

Sales(1, "East", 100);
Sales(2, "East", 150);
Sales(3, "East", 120);
Sales(1, "West", 200);
Sales(2, "West", 180);
Sales(3, "West", 220);

# Total per region
RegionalTotal(region:, total? += amount) distinct :- Sales(month, region, amount);

@OrderBy(Test, "region");
Test(region:, total:) :- RegionalTotal(region:, total:);
