# Test: an @OrderBy item that is not a column is refused, not emitted as SQL
@OrderBy(Test, "x; DROP TABLE t");
Test(x:) :- x in [1, 2];
