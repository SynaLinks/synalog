# Count= counts distinct values.
# Expect: rows N = [(2,)]
V(x:) :- x in [1, 1, 2];
N(n? Count= x) distinct :- V(x:);
