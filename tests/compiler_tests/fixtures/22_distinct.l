# Test: Distinct keyword

Data(category: "A", value: 1);
Data(category: "A", value: 2);
Data(category: "A", value: 1);
Data(category: "B", value: 1);
Data(category: "B", value: 1);

# Using distinct to remove duplicates
@OrderBy(UniqueCategories, "category");
UniqueCategories(category:) distinct :- Data(category:, value:);

# Distinct with aggregation
@OrderBy(CategoryStats, "category");
CategoryStats(category:, total? += value, count? += 1) distinct :- Data(category:, value:);

@OrderBy(Test, "category");
Test(category:) :- UniqueCategories(category:);
