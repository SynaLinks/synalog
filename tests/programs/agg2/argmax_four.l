# The name with the highest score.
# Expect: rows A = [("b",)]
V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
A(w? ArgMax= n -> s) distinct :- V(n:, s:);
