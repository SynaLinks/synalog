# A comparison with null keeps no row.
# Expect: rows N = [(2,)]
V(k: 1, x: null);
V(k: 2, x: 5);
N(k:) :- V(k:, x:), x > 1;
