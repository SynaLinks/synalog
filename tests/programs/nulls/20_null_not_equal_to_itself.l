# A variable equals itself, a null too: W has V's row, so no row of V is
# without one, and a sum of no rows is null.
# Expect: rows N = [(None,)]
V(x: null);
W(x:) :- V(x:), x == x;
N(n? += 1) distinct :- V(), ~W();
