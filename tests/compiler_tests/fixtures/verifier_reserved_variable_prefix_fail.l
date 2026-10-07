# Test: Variables starting with x_ are reserved. (from tests/programs/verifier/32_reserved_variable_prefix.l)
V(x_1:) :- x_1 in [1];
