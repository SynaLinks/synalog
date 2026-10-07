# A functor argument the rule does not depend on.
# Expect: error Functor Count is applied to Nope, which it does not depend on

All(c:) :- c in [1, 2, 3];
Odd(c:) :- c in [1, 3];
Count(n? += 1) distinct :- All(c:);
OddCount := Count(Nope: Odd);
