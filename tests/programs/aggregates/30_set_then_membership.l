# Membership in a set collected per group.
# Expect: rows A = [("a",), ("b",)]
V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 2);
V(g: "c", x: 3);
S(g:, s? Set= x) distinct :- V(g:, x:);
@OrderBy(A, "g");
A(g:) :- S(g:, s:), 2 in s;
