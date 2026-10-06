# Test: The same fact read twice does not meet itself on a null. (from tests/programs/joins3/same_null_fact_twice.l)

A(k: null, a: 1);
Q(a:) :- A(k:, a:), A(k:);
