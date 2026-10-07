# Test: StringAgg= over a single value. (from tests/programs/aggregation/11_string_agg_single.l)

V(s: "only");
A(s? StringAgg= s) distinct :- V(s:);
