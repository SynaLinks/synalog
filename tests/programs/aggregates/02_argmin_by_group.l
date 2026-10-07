# The item with the lowest score, per group.
# Expect: rows A = [("x", "a"), ("y", "d")]
V(g: "x", n: "a", s: 1);
V(g: "x", n: "b", s: 2);
V(g: "y", n: "c", s: 9);
V(g: "y", n: "d", s: 4);
@OrderBy(A, "g");
A(g:, w? ArgMin= n -> s) distinct :- V(g:, n:, s:);
