# Test: StringAgg= over numbers joins them as text. (from tests/programs/aggregation/14_string_agg_numbers.l)

V(x: 7);
A(s? StringAgg= x) distinct :- V(x:);
