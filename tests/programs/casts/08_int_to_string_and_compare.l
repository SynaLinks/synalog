# Comparing numbers as text.
# Expect: rows C = [("10",), ("9",)]
V(x:) :- x in [9, 10];
@OrderBy(C, "s");
C(s:) :- V(x:), s == ToString(x);
