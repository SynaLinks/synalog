# A combine expression sums a predicate.
# Expect: rows T = [(6,)]
V(x:) :- x in [1, 2, 3];
T(t:) :- t == (combine += x :- V(x:));
