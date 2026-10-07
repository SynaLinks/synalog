# distinct keeps one of equal rows.
# Expect: rows C = [(1,)]
V(x: 1);
V(x: 1);
D(x:) distinct :- V(x:);
C(n? += 1) distinct :- D(x:);
