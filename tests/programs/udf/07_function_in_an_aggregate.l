# A function applied inside an aggregate.
# Expect: rows T = [(14,)]
Square(x) = x * x;
V(x:) :- x in [1, 2, 3];
T(t? += Square(x)) distinct :- V(x:);
