# A variable only compared inside a negation has no value.
# Expect: error only appears negated
N(x:) :- x in [1, 2];
E(a: 1, b: 0);
Q(x:) :- N(x:), ~(E(a: x), y > 0);
