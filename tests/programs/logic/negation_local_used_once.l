# A variable written once inside a negation is a wildcard: refused.
# Expect: error Unsafe negation: variable 'y' only appears negated
N(x:) :- x in [1, 2];
E(a: 1, b: 0);
Q(x:) :- N(x:), ~(E(a: x, b: y), x > 0);
