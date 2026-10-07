# The average of per-group sums.
# Expect: rows A = [(5.0,)]
V(g: "a", x: 1);
V(g: "a", x: 3);
V(g: "b", x: 6);
S(g:, t? += x) distinct :- V(g:, x:);
A(a? Avg= t) distinct :- S(t:);
