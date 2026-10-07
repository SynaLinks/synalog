# The largest number field, as a number.
# Expect: rows M = [(100,)]
R(r: {n: x}) :- x in [100, 9, 10];
M(m? Max= r.n) distinct :- R(r:);
