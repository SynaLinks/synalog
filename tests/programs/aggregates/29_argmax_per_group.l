# The item with the highest score per group.
# Expect: rows A = [("x", "b"), ("y", "c")]
V(g: "x", n: "a", s: 1);
V(g: "x", n: "b", s: 2);
V(g: "y", n: "c", s: 7);
@OrderBy(A, "g");
A(g:, w? ArgMax= n -> s) distinct :- V(g:, n:, s:);
