# A misspelt predicate.
# Expect: error Undefined predicate 'Itme'

Item(x:) :- x in [1, 2];
Total(x:) :- Itme(x:);
