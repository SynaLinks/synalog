# The size of a set of strings.
# Expect: rows A = [(2,)]
V(s:) :- s in ["x", "y", "x"];
L(l? Set= s) distinct :- V(s:);
A(n: Size(l)) :- L(l:);
