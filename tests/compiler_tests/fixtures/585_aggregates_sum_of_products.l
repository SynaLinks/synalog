# Test: Summing products of two columns. (from tests/programs/aggregates/26_sum_of_products.l)

V(p: 2, q: 3);
V(p: 1, q: 5);
A(t? += p * q) distinct :- V(p:, q:);
