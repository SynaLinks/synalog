# Verifier Test: a functor argument naming an undefined predicate
# Expected Error: FunctorError.invalidFunctor
#
# Nope is not defined: the expansion would read a table named Nope.

All(c:) :- c in [1, 2, 3];
Count(n? += 1) distinct :- All(c:);

# ERROR: Nope is not defined
Fewer := Count(All: Nope);
