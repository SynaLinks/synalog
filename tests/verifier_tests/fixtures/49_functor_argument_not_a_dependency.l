# Verifier Test: a functor argument the predicate does not depend on
# Expected Error: FunctorError.invalidFunctor
#
# Count depends on All, not on Nope: replacing Nope changes nothing, and
# OddCount would silently count every row instead of the odd ones.

All(c:) :- c in [1, 2, 3];
Odd(c:) :- c in [1, 3];
Count(n? += 1) distinct :- All(c:);

# ERROR: Count does not depend on Nope
OddCount := Count(Nope: Odd);
