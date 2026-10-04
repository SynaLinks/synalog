# Computing with an aggregated value.
# Expect: rows D = [(12,)]
V(x:) :- x in [1, 2, 3];
T(t? += x) distinct :- V(x:);
D(d:) :- T(t:), d == t * 2;
