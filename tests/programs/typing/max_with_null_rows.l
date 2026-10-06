# A maximum over a column with nulls typed by other rows.
# Expect: rows Q = [(7,)]
V(v: null);
V(v: 7);
V(v: 3);
Q(m? Max= v) distinct :- V(v:);
