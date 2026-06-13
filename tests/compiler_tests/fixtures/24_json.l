# Test: String data (DuckDB)

# String data
JsonData("Alice", 30);
JsonData("Bob", 25);

@OrderBy(Test, "col0");
Test(name, age) :- JsonData(name, age);
