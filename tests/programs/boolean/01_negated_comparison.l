# Negating a comparison with !.
# Expect: rows B = [(1,), (2,)]
V(x:) :- x in [1, 2, 3];
@OrderBy(B, "x");
B(x:) :- V(x:), !(x > 2);
