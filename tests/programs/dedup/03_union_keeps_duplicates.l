# Two rules giving the same row give it twice.
# Expect: rows C = [(2,)]
U(x: 1);
U(x:) :- x in [1];
C(n? += 1) distinct :- U(x:);
