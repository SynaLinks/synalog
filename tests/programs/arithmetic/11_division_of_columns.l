# Dividing integer columns.
# Expect: rows A = [(1, 4, 0.25)]
V(a: 1, b: 4);
A(a:, b:, q: a / b) :- V(a:, b:);
