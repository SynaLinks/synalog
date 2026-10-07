# The size of a list collected per group.
# Expect: rows A = [("a", 2), ("b", 1)]
V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 3);
L(g:, l? List= x) distinct :- V(g:, x:);
@OrderBy(A, "g");
A(g:, n: Size(l)) :- L(g:, l:);
