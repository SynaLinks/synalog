# Two applications of one rule are independent.
# Expect: rows B = [(30,)]
Src(x: 0);
Total(t? += x) distinct :- Src(x:);
Small(x:) :- x in [1, 2];
Big(x:) :- x in [10, 20];
A := Total(Src: Small);
B := Total(Src: Big);
