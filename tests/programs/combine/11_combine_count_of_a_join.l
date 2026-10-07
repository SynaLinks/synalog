# Counting a join by a combine.
# Expect: rows T = [(2,)]
A(k:) :- k in [1, 2, 3];
B(k:) :- k in [2, 3, 4];
T(n:) :- n == (combine += 1 :- A(k:), B(k:));
