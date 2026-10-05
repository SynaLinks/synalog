# A grounded aggregate read twice.
# Expect: rows J = [(3, 3)]
V(x:) :- x in [1, 2];
@Ground(T);
T(t? += x) distinct :- V(x:);
J(a:, b:) :- T(t: a), T(t: b);
