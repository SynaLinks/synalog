# Verifier Test: a functor applying an undefined predicate
# Expected Error: FunctorError.invalidFunctor

All(c:) :- c in [1, 2, 3];
Odd(c:) :- c in [1, 3];

# ERROR: Countt is not defined
OddCount := Countt(All: Odd);
