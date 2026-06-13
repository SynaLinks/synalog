# Test: Multiple rules defining same predicate
@Engine("duckdb");

# Multiple rules for same predicate (union semantics)
Number(x) :- x in Range(5);
Number(x) :- x in [10, 11, 12, 13, 14];

# Conditional rules
Category(x, cat) :- Number(x), x < 5, cat == "small";
Category(x, cat) :- Number(x), x >= 5, x < 10, cat == "medium";
Category(x, cat) :- Number(x), x >= 10, cat == "large";

# Overlapping rules with aggregation
Stats(group, count? += 1) distinct :- Number(x), group == "all";
Stats(group, count? += 1) distinct :- Number(x), x % 2 == 0, group == "even";
Stats(group, count? += 1) distinct :- Number(x), x % 2 != 0, group == "odd";

@OrderBy(Test, "col0");
Test(x, cat) :- Category(x, cat);
