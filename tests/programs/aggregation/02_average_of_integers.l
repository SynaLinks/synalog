# The average of integers is a float.
# Expect: rows A = [(2.5,)]
V(x:) :- x in [1, 2, 3, 4];
A(m? Avg= x) distinct :- V(x:);
