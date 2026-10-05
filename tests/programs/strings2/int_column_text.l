# Integers of a column as text.
# Expect: rows Q = [(3, '3'), (12, '12'), (100, '100')]
V(n: 3);
V(n: 12);
V(n: 100);
@OrderBy(Q, "n");
Q(n:, s: ToString(n)) :- V(n:);
