# The empty string is a value, not null.
# Expect: rows S = [(1,)]
V(s: "");
S(n? += 1) distinct :- V(s:), s is not null;
