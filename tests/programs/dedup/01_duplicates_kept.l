# A predicate without distinct keeps duplicate rows.
# Expect: rows C = [(2,)]
V(x: 1);
V(x: 1);
C(n? += 1) distinct :- V(x:);
