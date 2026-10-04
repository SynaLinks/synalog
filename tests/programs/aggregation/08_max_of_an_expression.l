# Max over a computed value.
# Expect: rows A = [(9,)]
V(x:) :- x in [1, -3, 2];
A(m? Max= x * x) distinct :- V(x:);
