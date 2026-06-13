# Test: Conditional aggregation

Sales(category: "Electronics", amount: 500);
Sales(category: "Electronics", amount: 300);
Sales(category: "Books", amount: 50);
Sales(category: "Books", amount: 75);
Sales(category: "Clothing", amount: 200);

# Count and sum by category with conditions
@OrderBy(CategorySummary, "category");
CategorySummary(category:,
                total? += amount,
                high_value_count? += (if amount >= 200 then 1 else 0)) distinct :-
  Sales(category:, amount:);

@OrderBy(Test, "category");
Test(category:, total:, high_value_count:) :- CategorySummary(category:, total:, high_value_count:);
