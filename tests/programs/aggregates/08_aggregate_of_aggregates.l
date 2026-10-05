# The largest of the per-group sums.
# Expect: rows M = [(7,)]
V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 7);
S(g:, t? += x) distinct :- V(g:, x:);
M(m? Max= t) distinct :- S(t:);
