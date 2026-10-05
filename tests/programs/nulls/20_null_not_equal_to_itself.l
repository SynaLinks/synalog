# Null is not equal to null: no row is equal, and a sum of no rows is null.
# Expect: rows N = [(None,)]
V(x: null);
W(x:) :- V(x:), x == x;
N(n? += 1) distinct :- V(), ~W();
