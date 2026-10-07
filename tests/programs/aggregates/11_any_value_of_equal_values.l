# 1= takes any value, here all equal.
# Expect: rows A = [("g", 7)]
V(g: "g", x: 7);
V(g: "g", x: 7);
A(g:, v? 1= x) distinct :- V(g:, x:);
