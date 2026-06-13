# Test: Nested expressions and complex syntax
@Engine("duckdb");

# Data
Numbers(x) :- x in Range(10);

# Deeply nested arithmetic
NestedArith(x:,
            result: ((x + 1) * (x - 1)) / (x + 2) + ((x * x) - (x / 2))) :-
  Numbers(x), x > 0;

# Nested conditionals
NestedIf(x:,
         result: (if x > 5 then (if x > 8 then "high" else "mid") else "low")) :-
  Numbers(x);

# Nested function calls
NestedFunc(x:,
           result: Abs(Sin(x * 3.14159 / 180) * 100)) :-
  Numbers(x);

# Combined comparison chains
CompareChain(x:, y:) :-
  Numbers(x), Numbers(y),
  x > 0, y > 0,
  x < y, y < 8,
  x != y;

# Nested record access
Records(data: {name: "test", value: {a: 1, b: 2}});
RecordAccess(name:, inner_a:) :-
  Records(data:),
  name == data.name,
  inner_a == data.value.a;

@OrderBy(Test, "x");
Test(x:, result:) :- NestedArith(x:, result:);
