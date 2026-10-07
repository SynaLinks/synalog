# Test: Average of fractions. (from tests/programs/aggregates/03_avg_of_floats.l)

V(x:) :- x in [0.25, 0.75];
A(a? Avg= x) distinct :- V(x:);
