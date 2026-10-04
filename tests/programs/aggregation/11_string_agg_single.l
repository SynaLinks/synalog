# StringAgg= over a single value.
# Expect: rows A = [("only",)]
V(s: "only");
A(s? StringAgg= s) distinct :- V(s:);
