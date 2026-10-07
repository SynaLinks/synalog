# Average of fractions.
# Expect: rows A = [(0.5,)]
V(x:) :- x in [0.25, 0.75];
A(a? Avg= x) distinct :- V(x:);
