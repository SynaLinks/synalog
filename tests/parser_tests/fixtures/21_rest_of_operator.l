# Test: Selecting specific fields
@Engine("duckdb");

Data(a: 1, b: 2, c: 3, d: "x");
Data(a: 4, b: 5, c: 6, d: "y");
Data(a: 7, b: 8, c: 9, d: "z");

# Select specific fields, transform some
@OrderBy(Transformed, "d");
Transformed(a_doubled: 2 * a, c:, d:) :- Data(a:, b:, c:, d:);

# Select subset of fields
@OrderBy(Subset, "d");
Subset(c:, d:) :- Data(a:, b:, c:, d:);

@OrderBy(Test, "d");
Test(c:, d:) :- Subset(c:, d:);
