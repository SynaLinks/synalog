# Test: 1= takes the value of a group with one. (from tests/programs/aggregation/07_any_value.l)

R(k: "a", v: 7);
A(k:, v? 1= v) distinct :- R(k:, v:);
