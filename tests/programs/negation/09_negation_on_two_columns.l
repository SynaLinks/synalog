# A negation matching two columns.
# Expect: rows N = [(1, 2)]
P(a: 1, b: 1);
P(a: 1, b: 2);
Q(a: 1, b: 1);
N(a:, b:) :- P(a:, b:), ~Q(a:, b:);
