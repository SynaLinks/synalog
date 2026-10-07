# x only appears negated.
# Expect: error Unsafe negation

Banned(x: 1);
Allowed(x:) :- ~Banned(x:);
