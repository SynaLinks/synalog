# An empty list concatenated with a list of numbers from another predicate.
# Expect: rows Q = [(2,)]
A(l: []);
B(l: [1, 2]);
Q(n: Size(ArrayConcat(a, b))) :- A(l: a), B(l: b);
