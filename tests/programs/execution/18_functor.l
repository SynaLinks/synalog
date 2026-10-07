# A functor replaces a dependency.
# Expect: rows OddCount = [(2,)]
All(c:) :- c in [1, 2, 3];
Odd(c:) :- c in [1, 3];
Count(n? += 1) distinct :- All(c:);
OddCount := Count(All: Odd);
