# An aggregate over no rows, without a group, is one null row.
# Expect: rows A = [(None,)]
V(x:) :- x in [1], x > 5;
A(t? += x) distinct :- V(x:);
