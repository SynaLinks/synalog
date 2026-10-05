# Summing integers and fractions.
# Expect: rows A = [(3.5,)]
V(x: 1);
V(x: 2.5);
A(t? += x) distinct :- V(x:);
