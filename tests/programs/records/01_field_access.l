# Reading a field of a record.
# Expect: rows X = [(1,)]
R(r: {a: 1, b: 2});
X(a:) :- R(r:), a == r.a;
