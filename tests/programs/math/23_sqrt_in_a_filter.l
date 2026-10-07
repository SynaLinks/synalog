# Filtering by a square root.
# Expect: rows M = [(16,)]
V(x:) :- x in [4, 16];
M(x:) :- V(x:), Sqrt(x) > 3;
