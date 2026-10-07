# A sum of floats as text.
# Expect: rows Q = [("0.6",)]
V(x: 0.1);
V(x: 0.2);
V(x: 0.3);
T(t? += x) distinct :- V(x:);
Q(s: ToString(t)) :- T(t:);
