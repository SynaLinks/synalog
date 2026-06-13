# Compiler Test: Unbound In Comparison (should fail)
# Variable 'y' only in comparison, not bound by predicate.


Numbers(x) :- x in Range(10);
Test(x, y) :- Numbers(x), y > 5;
