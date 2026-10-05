# Counting with a combine expression.
# Expect: rows T = [(3,)]
V(x:) :- x in [5, 6, 7];
T(n:) :- n == (combine += 1 :- V(x:));
