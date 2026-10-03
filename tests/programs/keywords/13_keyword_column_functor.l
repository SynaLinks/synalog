# A functor over a predicate with a keyword column.
# Expect: rows OddN = [(2,)]
All(order:) :- order in [1, 2, 3];
Odd(order:) :- order in [1, 3];
Count(n? += 1) distinct :- All(order:);
OddN := Count(All: Odd);
