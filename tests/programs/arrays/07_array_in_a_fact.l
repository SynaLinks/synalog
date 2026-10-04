# An array held by a fact.
# Expect: rows S = [(3,)]
F(a: [1, 2, 3]);
S(n: Size(a)) :- F(a:);
