# Several aggregates over the same rows.
# Expect: rows A = [(3, 6, 1, 3, 2.0)]
V(x:) :- x in [1, 2, 3];
A(n? += 1, t? += x, lo? Min= x, hi? Max= x, a? Avg= x) distinct :- V(x:);
