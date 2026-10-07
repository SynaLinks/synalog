# Counting the groups over a threshold.
# Expect: rows A = [(2,)]
V(g: "a", x: 5);
V(g: "b", x: 1);
V(g: "c", x: 9);
S(g:, t? += x) distinct :- V(g:, x:);
A(n? += 1) distinct :- S(t:), t > 2;
