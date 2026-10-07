# Negating a predicate matched on a constant and a variable.
# Expect: rows N = [("a", 2)]
V(g: "a", x: 1);
V(g: "a", x: 2);
Done(g: "a", x: 1);
N(g:, x:) :- V(g:, x:), ~Done(g:, x:);
