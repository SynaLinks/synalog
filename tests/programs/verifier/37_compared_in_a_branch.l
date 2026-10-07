# x is compared in one branch of a disjunction and bound by nothing.
# Expect: error Unbound variable 'x': it is tested (compared, negated, matched) but never given a value
V(y:) :- y in [1, 2], (y > 1 | x < 0);
