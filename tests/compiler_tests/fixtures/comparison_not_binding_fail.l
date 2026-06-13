# Compiler Test: Comparison Not Binding (should fail)
# Variable only in comparison is not bound.


Numbers(x) :- x in Range(10);
Test(x, y) :- Numbers(x), y > 5;
