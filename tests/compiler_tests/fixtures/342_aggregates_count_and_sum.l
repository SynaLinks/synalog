# Test: Several aggregates over the same rows. (from tests/programs/aggregates/13_count_and_sum.l)

V(x:) :- x in [1, 2, 3];
A(n? += 1, t? += x, lo? Min= x, hi? Max= x, a? Avg= x) distinct :- V(x:);
