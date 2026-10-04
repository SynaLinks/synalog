# Two predicates with no shared variable: every pair.
# Expect: rows N = [(6,)]
A(x:) :- x in [1, 2];
B(y:) :- y in ["a", "b", "c"];
N(n? += 1) distinct :- A(x:), B(y:);
