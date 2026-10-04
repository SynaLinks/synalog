# Test: StringAgg= joins the values with commas, in no particular order. (from tests/programs/aggregation/13_string_agg_two_values.l)

V(s: "a");
V(s: "b");
J(j? StringAgg= s) distinct :- V(s:);
A(parts: Size(Split(j, ",")), length: Length(j)) :- J(j:);
