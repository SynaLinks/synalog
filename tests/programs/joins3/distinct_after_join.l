# Distinct after a join with duplicates.
# Expect: rows Q = [(1,)]
A(k: 1);
A(k: 1);
B(k: 1);
B(k: 1);
J(k:) distinct :- A(k:), B(k:);
Q(n? += 1) distinct :- J(k:);
