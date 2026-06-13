# Test: Constraint() row filtering

Numbers(x) :- x in Range(10);

# Constraint as an explicit row filter
@OrderBy(BigNumbers, "x");
BigNumbers(x:) :- Numbers(x), Constraint(x > 5);

# Constraint combining conditions
@OrderBy(MidNumbers, "x");
MidNumbers(x:) :- Numbers(x), Constraint(x >= 3 && x <= 7);

@OrderBy(Test, "x");
Test(x:) :- BigNumbers(x:);
