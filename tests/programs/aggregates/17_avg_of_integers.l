# The average of integers is a fraction.
# Expect: rows A = [(1.5,)]
V(x:) :- x in [1, 2];
A(a? Avg= x) distinct :- V(x:);
