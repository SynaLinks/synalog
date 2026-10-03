# Test: @Limit takes a number of rows
@Limit(Test, "two");
Test(x:) :- x in [1, 2];
