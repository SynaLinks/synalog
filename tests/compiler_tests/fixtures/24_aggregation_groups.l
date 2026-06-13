# Test: Aggregations with grouping

# Sales data
Sales("North", "A", 100);
Sales("North", "B", 150);
Sales("North", "A", 200);
Sales("South", "A", 120);
Sales("South", "B", 180);
Sales("South", "C", 90);
Sales("East", "A", 300);

# Group by one column - total sales per region
TotalByRegion(region, total? += amount) distinct :- Sales(region, product, amount);

# Group by multiple columns
TotalByRegionProduct(region, product, total? += amount) distinct :-
  Sales(region, product, amount);

# Count items per region
CountByRegion(region, count? += 1) distinct :- Sales(region, product, amount);

@OrderBy(Test, "region");
Test(region:, total:) :- TotalByRegion(region, total:);
