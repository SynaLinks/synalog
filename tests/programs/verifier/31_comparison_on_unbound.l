# x is only compared, never bound.
# Expect: error Unbound variable 'x': it is compared but never given a value
V(y:) :- y in [1], x > 2;
