# A column the predicate does not have.
# Expect: error y

Item(x:) :- x in [1, 2];
Total(y:) :- Item(y:);
