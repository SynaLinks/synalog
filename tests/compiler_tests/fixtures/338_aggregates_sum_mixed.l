# Test: Summing integers and fractions. (from tests/programs/aggregates/09_sum_mixed.l)

V(x: 1);
V(x: 2.5);
A(t? += x) distinct :- V(x:);
