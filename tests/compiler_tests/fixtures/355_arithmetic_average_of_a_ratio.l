# Test: A ratio of integers, then aggregated. (from tests/programs/arithmetic/12_average_of_a_ratio.l)

V(a: 1, b: 2);
V(a: 1, b: 1);
A(r? Avg= a / b) distinct :- V(a:, b:);
