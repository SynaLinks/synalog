# Negating a predicate of two rules.
# Expect: rows N = [(3,)]
V(x:) :- x in [1, 2, 3];
U(x: 1);
U(x: 2);
N(x:) :- V(x:), ~U(x:);
