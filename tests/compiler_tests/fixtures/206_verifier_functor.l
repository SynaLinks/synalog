# Test: A functor swaps a predicate. (from tests/programs/verifier/16_functor.l)

All(c:) :- c in [1, 2, 3];
Odd(c:) :- c in [1, 3];
Count(n? += 1) distinct :- All(c:);
OddCount := Count(All: Odd);
