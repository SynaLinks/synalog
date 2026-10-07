# Test: A maximum over a column with nulls typed by other rows. (from tests/programs/typing/max_with_null_rows.l)

V(v: null);
V(v: 7);
V(v: 3);
Q(m? Max= v) distinct :- V(v:);
