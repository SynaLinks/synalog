# Max skips nulls.
# Expect: rows N = [(2,)]
V(x: 1);
V(x: null);
V(x: 2);
N(m? Max= x) distinct :- V(x:);
