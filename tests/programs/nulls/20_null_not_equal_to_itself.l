# A variable holding null is not equal to itself (null equals nothing): W has
# no row, so V's row is without one, and the sum counts it.
# Expect: rows N = [(1,)]
V(x: null);
W(x:) :- V(x:), x == x;
N(n? += 1) distinct :- V(), ~W();
