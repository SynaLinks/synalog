# distinct keeps one null.
# Expect: rows N = [(1,)]
V(x: null);
V(x: null);
D(x:) distinct :- V(x:);
N(n? += 1) distinct :- D();
