# Test: An aggregating head needs distinct. (from tests/programs/verifier/24_aggregate_without_distinct.l)
V(x:) :- x in [1, 2];
Total(t? += x) :- V(x:);
