# Aggregating the rows a negation keeps.
# Expect: rows N = [(4,)]
V(x:) :- x in [1, 2, 3];
Skip(x: 2);
N(t? += x) distinct :- V(x:), ~Skip(x:);
