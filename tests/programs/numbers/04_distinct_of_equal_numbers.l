# 2 and 2.0 written as rows of one column.
# Expect: rows N = [(1,)]
V(x: 2.0);
V(x: 2.0);
D(x:) distinct :- V(x:);
N(n? += 1) distinct :- D(x:);
