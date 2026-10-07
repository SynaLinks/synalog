# Test: A null key is not equal to a constant. (from tests/programs/joins3/null_key_matched_by_a_constant.l)

A(k: null, a: 1);
Q(a:) :- A(k: 5, a:);
