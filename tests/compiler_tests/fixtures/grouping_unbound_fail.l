# Compiler Test: Grouping Unbound (should fail)
# Grouping variable never bound.


Sales(amount) :- amount in Range(100);
Test(category, total) :- total == Sum(amount), Sales(amount);
