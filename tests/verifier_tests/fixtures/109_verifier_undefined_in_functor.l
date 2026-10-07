# Verifier Test: A functor argument naming an undefined predicate.
# Expected Error: FunctorError.invalidFunctor
#
# (from tests/programs/verifier/29_undefined_in_functor.l)

All(c:) :- c in [1, 2, 3];
Count(n? += 1) distinct :- All(c:);
Fewer := Count(All: Nope);
