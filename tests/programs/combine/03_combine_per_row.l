# A combine expression correlated with each row.
# Expect: rows T = [("a", 3), ("b", 4)]
V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 4);
G(g:) distinct :- V(g:);
@OrderBy(T, "g");
T(g:, t:) :- G(g:), t == (combine += x :- V(g:, x:));
