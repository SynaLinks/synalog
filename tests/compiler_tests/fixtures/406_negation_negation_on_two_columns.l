# Test: A negation matching two columns. (from tests/programs/negation/09_negation_on_two_columns.l)

P(a: 1, b: 1);
P(a: 1, b: 2);
Q(a: 1, b: 1);
N(a:, b:) :- P(a:, b:), ~Q(a:, b:);
