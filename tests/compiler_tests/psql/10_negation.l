# Test: Basic filtering (simplified from negation)

Number(x) :- x in Range(10);

# Filter for even numbers
Even(x) :- Number(x), x % 2 == 0;

# Filter for numbers > 5
Large(x) :- Number(x), x > 5;

# Combine filters
LargeEven(x) :- Even(x), Large(x);

@OrderBy(Test, "col0");
Test(x) :- LargeEven(x);
