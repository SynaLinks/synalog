# The smallest string per group.
# Expect: rows A = [(1, "ant"), (2, "bee")]
V(g: 1, s: "cat");
V(g: 1, s: "ant");
V(g: 2, s: "bee");
@OrderBy(A, "g");
A(g:, m? Min= s) distinct :- V(g:, s:);
