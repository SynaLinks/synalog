# A negation comparing with `is` finds a null key; joined by name, a null key
# meets no row, as in SQL.
# Expect: rows NotInB = [(1,)]
# Expect: rows NotJoined = [(1,), (None,)]
@OrderBy(NotInB, "k"); @OrderBy(NotJoined, "k");
A(k: 1);
A(k: null);
B(k: null);
NotInB(k:) :- A(k:), ~(B(k: j), j is k);
NotJoined(k:) :- A(k:), ~B(k:);
