# A column the predicate does not have.
# Expect: error Unknown column 'y' for predicate 'Item'

Item(x:) :- x in [1, 2];
Total(y:) :- Item(y:);
