# printf-style formatting.
# Expect: rows S = [("a-3",)]
S(s: Format("%s-%s", "a", ToString(3)));
