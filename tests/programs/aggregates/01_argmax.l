# The item with the highest score.
# Expect: rows A = [("b",)]
V(n: "a", s: 3);
V(n: "b", s: 5);
V(n: "c", s: 1);
A(w? ArgMax= n -> s) distinct :- V(n:, s:);
