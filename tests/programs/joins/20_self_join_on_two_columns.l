# Pairs of rows that agree on one column and differ on another.
# Expect: rows J = [("a", 1, 2)]
V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 3);
J(g:, x1:, x2:) :- V(g:, x: x1), V(g:, x: x2), x1 < x2;
