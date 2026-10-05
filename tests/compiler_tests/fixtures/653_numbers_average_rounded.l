# Test: Rounding an average. (from tests/programs/numbers/08_average_rounded.l)

V(x:) :- x in [1, 2, 4];
A(a? Avg= x) distinct :- V(x:);
N(r: Round(a, 2)) :- A(a:);
