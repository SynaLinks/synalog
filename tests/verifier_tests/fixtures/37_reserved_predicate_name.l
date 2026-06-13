# Verifier Test: Reserved Predicate Name
# Expected Error: reservedPredicate
#
# 'Num' is defined by the built-in library program that is injected into
# every compiled program; redefining it collides with the library.

Num(n: 1);
Num(n: 2);
