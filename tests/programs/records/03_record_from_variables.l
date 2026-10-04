# Building a record from variables, then reading it back.
# Expect: rows X = [("ann", 3)]
P(name: "ann", n: 3);
Q(rec:) :- P(name:, n:), rec == {name:, n:};
X(name:, n:) :- Q(rec:), name == rec.name, n == rec.n;
