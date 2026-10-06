# Test: The same fact read twice meets itself on a value. (from tests/programs/joins3/same_fact_twice.l)

A(k: 5, a: 1);
Q(a:) :- A(k:, a:), A(k:);
