# Min= ignores nulls.
# Expect: rows N = [(4,)]
V(x: null);
V(x: 4);
V(x: 9);
N(m? Min= x) distinct :- V(x:);
