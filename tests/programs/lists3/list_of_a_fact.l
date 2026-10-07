# A list held by a fact.
# Expect: rows Q = [(3, 6)]
F(l: [1, 2, 3]);
T(t? += x) distinct :- F(l:), x in l;
Q(n: Size(l), t:) :- F(l:), T(t:);
