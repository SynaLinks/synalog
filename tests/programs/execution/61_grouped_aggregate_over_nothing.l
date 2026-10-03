# With a group column, no rows means no group: no row at all.
# Expect: rows Total = []
V(k:, x:) :- k in ["a"], x in [1, 2];
Total(k:, t? += x) distinct :- V(k:, x:), x > 10;
