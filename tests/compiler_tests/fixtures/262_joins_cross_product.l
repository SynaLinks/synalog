# Test: Two predicates with no shared variable: every pair. (from tests/programs/joins/05_cross_product.l)

A(x:) :- x in [1, 2];
B(y:) :- y in ["a", "b", "c"];
N(n? += 1) distinct :- A(x:), B(y:);
