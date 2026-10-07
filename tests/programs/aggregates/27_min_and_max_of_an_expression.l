# Min and max of a computed value.
# Expect: rows A = [(-3, 3)]
V(x:) :- x in [-3, 1, 3];
A(lo? Min= x, hi? Max= -x * -1) distinct :- V(x:);
