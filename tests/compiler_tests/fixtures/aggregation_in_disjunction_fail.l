# Compiler Test: Aggregation In Disjunction (should fail)
# Unbound variable in aggregation inside disjunction.


Numbers(x) :- x in Range(10);
Test(x, total) :- Numbers(x), (total == Sum(y) | total == 0);
