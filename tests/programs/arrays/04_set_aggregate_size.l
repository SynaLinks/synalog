# Set= collects distinct values.
# Expect: rows N = [(2,)]
V(x:) :- x in [1, 1, 2];
L(l? Set= x) distinct :- V(x:);
N(n: Size(l)) :- L(l:);
