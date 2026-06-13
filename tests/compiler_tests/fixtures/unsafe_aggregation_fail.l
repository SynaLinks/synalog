# Compiler Test: Unsafe Aggregation (should fail)
# Variable 'y' in Sum not bound outside aggregation.


Numbers(x) :- x in Range(10);
Test(x, total) :- Numbers(x), total == Sum(y);
