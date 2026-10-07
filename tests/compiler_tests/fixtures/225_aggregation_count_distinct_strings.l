# Test: Count= over strings. (from tests/programs/aggregation/10_count_distinct_strings.l)

V(s:) :- s in ["x", "y", "x"];
A(n? Count= s) distinct :- V(s:);
