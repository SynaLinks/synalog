# Test: Min over strings. (from tests/programs/aggregation/03_min_of_strings.l)

V(s:) :- s in ["pear", "apple", "fig"];
A(m? Min= s) distinct :- V(s:);
