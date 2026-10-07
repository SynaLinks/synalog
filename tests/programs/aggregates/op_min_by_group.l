# Min= per group.
# Expect: rows A = [('a', 1), ('b', 5)]
V(g: "a", x:) :- x in [4, 1, 7, 1];
V(g: "b", x: 5);
@OrderBy(A, "g");
A(g:, v? Min= x) distinct :- V(g:, x:);
