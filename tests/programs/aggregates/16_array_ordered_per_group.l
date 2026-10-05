# Array= per group.
# Expect: rows A = [("x", [2, 1]), ("y", [3])]
V(g: "x", k: 2, v: 1);
V(g: "x", k: 1, v: 2);
V(g: "y", k: 5, v: 3);
@OrderBy(A, "g");
A(g:, l? Array= k -> v) distinct :- V(g:, k:, v:);
