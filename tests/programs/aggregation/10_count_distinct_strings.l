# Count= over strings.
# Expect: rows A = [(2,)]
V(s:) :- s in ["x", "y", "x"];
A(n? Count= s) distinct :- V(s:);
