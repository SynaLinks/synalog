# Test: Boolean expressions

Data(a: 1, b: 2);
Data(a: 3, b: 1);
Data(a: 5, b: 5);
Data(a: 2, b: 4);

# Boolean conditions
@OrderBy(BoolResults, "a");
BoolResults(a:, b:, a_gt_b: a > b, eq: a == b) :- Data(a:, b:);

# Filtering with boolean
@OrderBy(Filtered, "a");
Filtered(a:, b:) :- Data(a:, b:), a >= b;

@OrderBy(Test, "a");
Test(a:, b:) :- Filtered(a:, b:);
