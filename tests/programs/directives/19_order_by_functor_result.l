# Ordering a functor's result, by the column it inherits.
# Expect: rows OddItems = [(3,), (1,)]
All(c:) :- c in [1, 2, 3];
Odd(c:) :- c in [1, 3];
Items(c:) :- All(c:);
@OrderBy(OddItems, "c DESC");
OddItems := Items(All: Odd);
