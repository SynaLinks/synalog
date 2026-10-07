# Membership in each group's list.
# Expect: rows A = [("a",)]
V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 3);
L(g:, l? List= x) distinct :- V(g:, x:);
A(g:) :- L(g:, l:), 2 in l;
