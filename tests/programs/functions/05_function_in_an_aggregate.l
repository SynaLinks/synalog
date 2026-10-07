# A function inside an aggregate.
# Expect: rows R = [(14,)]
Square(x) = x * x;
V(x:) :- x in [1, 2, 3];
R(t? += Square(x)) distinct :- V(x:);
