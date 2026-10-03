# An aggregating head needs distinct.
# Expect: error distinct
V(x:) :- x in [1, 2];
Total(t? += x) :- V(x:);
