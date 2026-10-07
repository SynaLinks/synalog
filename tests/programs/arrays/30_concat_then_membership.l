# Membership in a concatenation of columns.
# Expect: rows A = [(3,)]
V(a: [1, 2], b: [3]);
A(x:) :- V(a:, b:), x in ArrayConcat(a, b), x > 2;
