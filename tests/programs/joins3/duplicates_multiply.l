# A join with duplicate rows keeps every combination.
# Expect: rows Q = [(4,)]
A(k: 1);
A(k: 1);
B(k: 1);
B(k: 1);
Q(n? += 1) distinct :- A(k:), B(k:);
