# Concatenating an array with an empty one.
# Expect: rows A = [(2,)]
V(l: [1, 2]);
A(n: Size(ArrayConcat(l, []))) :- V(l:);
