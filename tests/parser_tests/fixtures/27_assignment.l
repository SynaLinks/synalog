# Test: Assignment operator (:=)
@Engine("duckdb");

BaseData(x) :- x in Range(5);

# Chain rules
Step1(x, y) :- BaseData(x), y == x + 1;
Step2(x, y, z) :- Step1(x, y), z == y * 2;

@OrderBy(Test, "col0");
Test(x, y) :- Step1(x, y);
