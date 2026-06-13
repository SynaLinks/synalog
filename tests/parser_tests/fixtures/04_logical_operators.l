# Test: Logical operators
@Engine("duckdb");

Numbers(x) :- x in Range(10);

# Logical AND (&&)
BothConditions(x) :- Numbers(x), x > 2 && x < 7;

# Logical OR (||)
EitherCondition(x, result: x < 3 || x > 6) :- Numbers(x);

# Logical NOT (!)
NotSmall(x, result: !(x < 5)) :- Numbers(x);

# Combined logical expressions
Complex(x) :- Numbers(x), (x > 2 && x < 4) || (x > 6 && x < 9);

@OrderBy(Test, "test_name", "x");
Test(test_name: "and", x:) :- BothConditions(x);
Test(test_name: "complex", x:) :- Complex(x);
