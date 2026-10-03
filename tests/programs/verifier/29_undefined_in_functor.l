# A functor argument naming an undefined predicate.
# Expect: error Functor Fewer names 'Nope', which the program does not define.
All(c:) :- c in [1, 2, 3];
Count(n? += 1) distinct :- All(c:);
Fewer := Count(All: Nope);
