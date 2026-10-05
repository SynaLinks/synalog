# Test: 1= takes any value, here all equal. (from tests/programs/aggregates/11_any_value_of_equal_values.l)

V(g: "g", x: 7);
V(g: "g", x: 7);
A(g:, v? 1= x) distinct :- V(g:, x:);
