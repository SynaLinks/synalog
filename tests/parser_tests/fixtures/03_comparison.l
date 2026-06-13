# Test: Comparison operators
@Engine("duckdb");

Numbers(x) :- x in Range(10);

# Equality and inequality
EqualToFive(x) :- Numbers(x), x == 5;
NotEqualToFive(x) :- Numbers(x), x != 5;

# Relational comparisons
LessThanFive(x) :- Numbers(x), x < 5;
LessOrEqual(x) :- Numbers(x), x <= 5;
GreaterThanFive(x) :- Numbers(x), x > 5;
GreaterOrEqual(x) :- Numbers(x), x >= 5;

# Chained comparisons
InRange(x) :- Numbers(x), x >= 3, x <= 7;

@OrderBy(Test, "test_name", "x");
Test(test_name: "equal", x:) :- EqualToFive(x);
Test(test_name: "not_equal", x:) :- NotEqualToFive(x);
Test(test_name: "less_than", x:) :- LessThanFive(x);
Test(test_name: "in_range", x:) :- InRange(x);
