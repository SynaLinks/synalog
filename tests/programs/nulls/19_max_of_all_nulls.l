# Max= of only nulls is null.
# Expect: rows N = [(None,)]
V(x: null);
V(x: null);
N(m? Max= x) distinct :- V(x:);
