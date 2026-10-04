# Substr past the end returns what there is.
# Expect: rows S = [("bc",)]
S(s: Substr("abc", 2, 10));
