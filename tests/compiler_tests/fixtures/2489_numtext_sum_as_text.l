# Test: A sum of floats as text. (from tests/programs/numtext/sum_as_text.l)

V(x: 0.1);
V(x: 0.2);
V(x: 0.3);
T(t? += x) distinct :- V(x:);
Q(s: ToString(t)) :- T(t:);
