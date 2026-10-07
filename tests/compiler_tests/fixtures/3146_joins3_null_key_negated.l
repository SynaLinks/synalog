# Test: A null key is not found by a negation either: the row stays. (from tests/programs/joins3/null_key_negated.l)

A(k: null, a: 1);
B(k: null);
Q(a:) :- A(k:, a:), ~B(k:);
