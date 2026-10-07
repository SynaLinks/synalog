# The largest value of each row's group, by a combine.
# Expect: rows T = [("a", 1, 2), ("a", 2, 2), ("b", 5, 5)]
V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 5);
@OrderBy(T, "g", "x");
T(g:, x:, m:) :- V(g:, x:), m == (combine Max= y :- V(g:, x: y));
