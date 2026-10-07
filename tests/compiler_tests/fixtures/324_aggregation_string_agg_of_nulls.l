# Test: StringAgg= skips nulls, and is null when every value is. (from tests/programs/aggregation/15_string_agg_of_nulls.l)

V(g: "g", s: null);
V(g: "h", s: null);
V(g: "h", s: "x");
@OrderBy(A, "g");
A(g:, s? StringAgg= s) distinct :- V(g:, s:);
