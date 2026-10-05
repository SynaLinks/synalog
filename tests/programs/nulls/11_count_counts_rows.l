# += 1 counts rows, whether a column is null or not.
# Expect: rows N = [(2,)]
V(x: null);
V(x: 1);
N(n? += 1) distinct :- V(x:);
