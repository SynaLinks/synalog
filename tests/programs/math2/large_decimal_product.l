# Large products of numbers with a point do not overflow.
# Expect: rows Q = [(2500000000000.0,)]
V(x: 2.5);
V(x: 1000000);
Q(v? Max= x * x * 2.5) distinct :- V(x:);
