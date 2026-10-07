# Test: Max over strings. (from tests/programs/execution/69_string_max.l)

F(n:) :- n in ["apple", "pear", "fig"];
Last(n? Max= n) distinct :- F(n:);
