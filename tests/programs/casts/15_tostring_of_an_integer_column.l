# Integers of a column as text.
# Expect: rows C = [("10",), ("9",)]
V(x:) :- x in [9, 10];
@OrderBy(C, "s");
C(s: ToString(x)) :- V(x:);
