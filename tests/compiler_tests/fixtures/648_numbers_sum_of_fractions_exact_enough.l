# Test: A sum of fractions. (from tests/programs/numbers/03_sum_of_fractions_exact_enough.l)

V(x:) :- x in [0.25, 0.25, 0.5];
N(t? += x) distinct :- V(x:);
