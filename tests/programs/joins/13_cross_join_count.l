# A join without a shared column pairs every row.
# Expect: rows J = [(6,)]
A(a:) :- a in [1, 2];
B(b:) :- b in [1, 2, 3];
J(n? += 1) distinct :- A(a:), B(b:);
