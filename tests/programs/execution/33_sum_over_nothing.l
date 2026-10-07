# An aggregate with no group column over no rows: one row, holding null, as
# SQL's SUM without GROUP BY (Logica's behaviour, kept).
# Expect: rows Total = [(None,)]
V(x:) :- x in [1, 2];
Total(t? += x) distinct :- V(x:), x > 10;
