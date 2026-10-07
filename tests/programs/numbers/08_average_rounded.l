# Rounding an average.
# Expect: rows N = [(2.33,)]
V(x:) :- x in [1, 2, 4];
A(a? Avg= x) distinct :- V(x:);
N(r: Round(a, 2)) :- A(a:);
