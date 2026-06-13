# Test: Functors

# Base data predicates
Events1(category: "A", count: 10);
Events1(category: "A", count: 20);
Events1(category: "B", count: 15);

Events2(category: "B", count: 5);
Events2(category: "C", count: 25);
Events2(category: "C", count: 30);

# Functor definition - parameterized by Events
TotalByCategory(category:, total? += count) distinct :- Events(category:, count:);

# Instantiate functor with different data sources
@Make(Total1, TotalByCategory, {Events: Events1});
@Make(Total2, TotalByCategory, {Events: Events2});

@OrderBy(Test, "source", "category");
Test(source: "events1", category:, total:) :- Total1(category:, total:);
Test(source: "events2", category:, total:) :- Total2(category:, total:);
