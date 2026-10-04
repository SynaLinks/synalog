# 1= takes the value of a group with one.
# Expect: rows A = [("a", 7)]
R(k: "a", v: 7);
A(k:, v? 1= v) distinct :- R(k:, v:);
