# Test: Range and list operations

# Generate numbers using Range
Numbers(x) :- x in Range(5);

# Filter and transform range values
Filtered(x:, squared: x * x) :- Numbers(x), x > 1;

@OrderBy(Test, "x");
Test(x:, squared:) :- Filtered(x:, squared:);
