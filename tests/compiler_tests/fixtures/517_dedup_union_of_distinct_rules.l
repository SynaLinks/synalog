# Test: Each rule distinct, the union not. (from tests/programs/dedup/06_union_of_distinct_rules.l)

V(x: 1);
V(x: 1);
A(x:) distinct :- V(x:);
B(x:) distinct :- V(x:);
U(x:) :- A(x:) | B(x:);
C(n? += 1) distinct :- U(x:);
