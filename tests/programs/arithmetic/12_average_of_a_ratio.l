# A ratio of integers, then aggregated.
# Expect: rows A = [(0.75,)]
V(a: 1, b: 2);
V(a: 1, b: 1);
A(r? Avg= a / b) distinct :- V(a:, b:);
