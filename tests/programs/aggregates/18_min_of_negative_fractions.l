# The minimum of negative fractions.
# Expect: rows A = [(-2.5,)]
V(x:) :- x in [-1.5, -2.5, 0.5];
A(m? Min= x) distinct :- V(x:);
