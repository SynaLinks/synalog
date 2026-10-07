# Max= per group.
# Expect: rows A = [('a', 7), ('b', 5)]
V(g: "a", x:) :- x in [4, 1, 7, 1];
V(g: "b", x: 5);
@OrderBy(A, "g");
A(g:, v? Max= x) distinct :- V(g:, x:);
