# Avg= per group.
# Expect: rows A = [('a', 3.25), ('b', 5.0)]
V(g: "a", x:) :- x in [4, 1, 7, 1];
V(g: "b", x: 5);
@OrderBy(A, "g");
A(g:, v? Avg= x) distinct :- V(g:, x:);
