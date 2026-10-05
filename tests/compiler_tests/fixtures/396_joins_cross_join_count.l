# Test: A join without a shared column pairs every row. (from tests/programs/joins/13_cross_join_count.l)

A(a:) :- a in [1, 2];
B(b:) :- b in [1, 2, 3];
J(n? += 1) distinct :- A(a:), B(b:);
