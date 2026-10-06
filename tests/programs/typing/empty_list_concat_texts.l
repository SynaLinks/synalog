# An empty list concatenated with a list of texts from another predicate.
# Expect: rows Q = [(2,)]
A(l: []);
B(l: ["a", "b"]);
Q(n: Size(ArrayConcat(a, b))) :- A(l: a), B(l: b);
