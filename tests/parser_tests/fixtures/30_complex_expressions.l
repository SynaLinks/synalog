# Test: Complex nested expressions
@Engine("duckdb");

Data(x) :- x in Range(10);

# Nested arithmetic
Complex1(x, result) :- Data(x), x > 1, result == ((x + 1) * (x - 1)) / (x + 2);

# Nested conditionals with arithmetic
Complex2(x, result) :-
  Data(x),
  result == (if x < 3 then x * 2
             else if x < 6 then x + 10
             else x * x - 20);

@OrderBy(Test, "col0");
Test(x, result) :- Complex2(x, result);
