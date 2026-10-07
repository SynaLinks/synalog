# StringAgg= over numbers joins them as text.
# Expect: rows A = [("7",)]
V(x: 7);
A(s? StringAgg= x) distinct :- V(x:);
