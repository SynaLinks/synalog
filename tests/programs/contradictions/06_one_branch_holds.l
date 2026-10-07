# One branch of a disjunction can hold: no warning, and the row is there.
# Expect: valid
# Expect: rows C = [(3,)]
V(x:) :- x in [1, 3, 7];
C(x:) :- V(x:), (x < 0 | x > 1), x == 3;
